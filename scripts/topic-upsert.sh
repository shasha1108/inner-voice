#!/usr/bin/env bash
# 选题资产库 — 飞书多维表格写入（含自动建表）
# 用法: bash scripts/topic-upsert.sh '<json_payload>'
#
# JSON payload 使用字段名作为 key（非按顺序），lark-cli 按字段名匹配。
#
# {
#   "情绪主题词":"...",
#   "选题":"...",
#   "核心悖论（待命名的感受）":"...",
#   "信号来源追溯":"...",
#   "趋势温度":"严肃沉重",
#   "视觉锚点":"...",
#   "传播因子":"...",
#   "Pinterest 视觉调研":"...",
#   "搜索价值":"高(1w+)",
#   "全球信号强度":"强",
#   "简中竞争烈度":"蓝海",
#   "全球信号来源":"Reddit r/self",
#   "写作难度":"中",
#   "视觉差异化":"...",
#   "推荐指数":4,
#   "添加时间":"2026-06-25T10:00:00+08:00"
# }
set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
ENV_FILE="$SCRIPT_DIR/../.env"
[ -f "$ENV_FILE" ] && source "$ENV_FILE"

BASE_TOKEN="${FEISHU_BASE_TOKEN:-}"
if [ -z "$BASE_TOKEN" ]; then
  echo "⚠️ FEISHU_BASE_TOKEN 未配置，正在自动创建飞书 Base「资产库」..." >&2
  CREATE_RESULT=$(lark-cli base +base-create --name "资产库" --as user 2>&1) || true
  BASE_TOKEN=$(echo "$CREATE_RESULT" | python3 -c "
import sys, json
try:
 data = json.load(sys.stdin)
 tok = ((data.get('data') or {}).get('base') or {}).get('base_token') or ''
 print(tok)
except Exception:
 print('')
" 2>/dev/null || echo "")
  if [ -z "$BASE_TOKEN" ]; then
    echo "❌ 自动创建 Base 失败，原始返回: $CREATE_RESULT" >&2
    exit 1
  fi
  # 写入 .env
  if grep -q "^FEISHU_BASE_TOKEN=" "$ENV_FILE" 2>/dev/null; then
    sed -i.bak "s|^FEISHU_BASE_TOKEN=.*|FEISHU_BASE_TOKEN=$BASE_TOKEN|" "$ENV_FILE" && rm -f "${ENV_FILE}.bak"
  else
    echo "FEISHU_BASE_TOKEN=$BASE_TOKEN" >> "$ENV_FILE"
  fi
  echo "✅ Base「资产库」已创建，Token 已写入 .env" >&2
fi
PAYLOAD="${1:-}"

if [ -z "$PAYLOAD" ]; then
 echo "用法: topic-upsert.sh '<json_payload>'" >&2
 exit 1
fi

# ── 自动建表（仅在 FEISHU_TOPIC_TABLE_ID 未配置时执行）──────────────────────
if [ -z "${FEISHU_TOPIC_TABLE_ID:-}" ]; then
 echo "⚠️ 未检测到 FEISHU_TOPIC_TABLE_ID，正在自动创建「选题资产库」表格..." >&2

 CREATE_RESULT=$(lark-cli base +table-create \
 --base-token "$BASE_TOKEN" \
 --name "选题资产库" \
 --as user 2>&1) || true

 TABLE_ID=$(echo "$CREATE_RESULT" | python3 -c "
import sys, json
try:
 data = json.load(sys.stdin)
 tid = ((data.get('data') or {}).get('table') or {}).get('id') or ''
 print(tid)
except Exception:
 print('')
" 2>/dev/null || echo "")

 if [ -z "$TABLE_ID" ]; then
 echo "❌ 自动建表失败。请在飞书 Base 中手动创建「选题资产库」表格，" >&2
 echo " 然后将表格 ID 填入 .env: FEISHU_TOPIC_TABLE_ID=your_table_id" >&2
 echo " 原始返回: $CREATE_RESULT" >&2
 exit 1
 fi

 # 创建字段（type: text/number/select/datetime）
 FIELDS=(
 '{"name":"情绪主题词","type":"text"}'
 '{"name":"选题","type":"text"}'
 '{"name":"核心悖论（待命名的感受）","type":"text"}'
 '{"name":"信号来源追溯","type":"text"}'
 '{"name":"趋势温度","type":"select","options":[{"name":"轻量幽默"},{"name":"温暖治愈"},{"name":"严肃沉重"},{"name":"冷静克制"}]}'
 '{"name":"视觉锚点","type":"text"}'
 '{"name":"传播因子","type":"text"}'
 '{"name":"Pinterest 视觉调研","type":"text"}'
 '{"name":"搜索价值","type":"select","options":[{"name":"高(1w+)"},{"name":"中(1k-1w)"},{"name":"低(<1k)"}]}'
 '{"name":"全球信号强度","type":"select","options":[{"name":"强"},{"name":"中"},{"name":"弱"}]}'
 '{"name":"简中竞争烈度","type":"select","options":[{"name":"红海"},{"name":"中等"},{"name":"蓝海"}]}'
 '{"name":"全球信号来源","type":"text"}'
 '{"name":"写作难度","type":"select","options":[{"name":"高"},{"name":"中"},{"name":"低"}]}'
 '{"name":"视觉差异化","type":"text"}'
 '{"name":"推荐指数","type":"number"}'
 '{"name":"添加时间","type":"datetime"}'
 )

 echo " 正在创建字段..." >&2
 for FIELD in "${FIELDS[@]}"; do
 lark-cli base +field-create \
 --base-token "$BASE_TOKEN" \
 --table-id "$TABLE_ID" \
 --as user \
 --json "$FIELD" >/dev/null 2>&1 || \
 echo " ⚠️ 字段创建跳过（可能已存在）: $(echo "$FIELD" | python3 -c "import sys,json; d=json.load(sys.stdin); print(d.get('name',''))" 2>/dev/null)" >&2
 done

 # 写入 .env
 if grep -q "^FEISHU_TOPIC_TABLE_ID=" "$ENV_FILE" 2>/dev/null; then
 sed -i.bak "s|^FEISHU_TOPIC_TABLE_ID=.*|FEISHU_TOPIC_TABLE_ID=$TABLE_ID|" "$ENV_FILE" && rm -f "${ENV_FILE}.bak"
 else
 echo "FEISHU_TOPIC_TABLE_ID=$TABLE_ID" >> "$ENV_FILE"
 fi

 echo "✅ 「选题资产库」已创建，TABLE_ID=$TABLE_ID 已写入 .env" >&2
 FEISHU_TOPIC_TABLE_ID="$TABLE_ID"
fi

# ── 写入记录 ─────────────────────────────────────────────────────────────────
lark-cli base +record-upsert \
 --base-token "$BASE_TOKEN" \
 --table-id "$FEISHU_TOPIC_TABLE_ID" \
 --as user \
 --json "$PAYLOAD" 2>&1

EXIT_CODE=$?
[ $EXIT_CODE -ne 0 ] && echo "❌ 飞书写入失败 (exit code: $EXIT_CODE)" >&2
exit $EXIT_CODE
