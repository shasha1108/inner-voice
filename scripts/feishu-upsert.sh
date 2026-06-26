#!/usr/bin/env bash
# 飞书内容资产库表 — 写入/更新（含自动建表）
# 用法: bash scripts/feishu-upsert.sh '<json_payload>'
#
# JSON payload 使用字段名作为 key（非按顺序），lark-cli 按字段名匹配。
# 笔记ID 作为 upsert 匹配键（表格首个文本字段），同名则更新、不同名则新建。
#
# ── STEP 9 全量写入（19 个字段全部传入）─────────────────────────────
# {
#   "笔记ID":"2026062501",
#   "生成时间":"2026-06-25",
#   "情绪主题词":"焦虑",
#   "内容类型":"图文",
#   "笔记标题":"...",
#   "正文文案":"...",
#   "结尾钩子":"...",
#   "隐喻命名":"玻璃盒",
#   "情绪类型":"空间型",
#   "叙事角度":"A感知细节",
#   "MJ提示词":"...",
#   "标签":"#情绪 #...",
#   "视觉特征":"...",
#   "发布状态":"待发布",
#   "点赞":0,"收藏":0,"评论":0,"分享":0,
#   "复盘结果":""
# }
#
# ── Flow D 部分更新（只传需要更新的字段）─────────────────────────────
# {
#   "笔记ID":"2026062501",
#   "发布状态":"已发布",
#   "点赞":247,"收藏":112,"评论":58,"分享":15,
#   "复盘结果":"爆款"
# }
# （未传入的字段保持原值不动）
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
 echo "用法: feishu-upsert.sh '<json_payload>'" >&2
 exit 1
fi

# ── 自动建表（仅在 FEISHU_CONTENT_TABLE_ID 未配置时执行）───────────────────────────
if [ -z "${FEISHU_CONTENT_TABLE_ID:-}" ]; then
 echo "⚠️ 未检测到 FEISHU_CONTENT_TABLE_ID，正在自动创建「内容资产库」表格..." >&2

 CREATE_RESULT=$(lark-cli base +table-create \
   --base-token "$BASE_TOKEN" \
   --name "内容资产库" \
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
   echo "❌ 自动建表失败。请在飞书 Base 中手动创建「内容资产库」表格，" >&2
   echo " 然后将表格 ID 填入 .env: FEISHU_CONTENT_TABLE_ID=your_table_id" >&2
   echo " 原始返回: $CREATE_RESULT" >&2
   exit 1
 fi

 # 创建字段（type: text/number/select/datetime）
 FIELDS=(
   '{"name":"笔记ID","type":"text"}'
   '{"name":"生成时间","type":"datetime"}'
   '{"name":"情绪主题词","type":"text"}'
   '{"name":"内容类型","type":"text"}'
   '{"name":"笔记标题","type":"text"}'
   '{"name":"正文文案","type":"text"}'
   '{"name":"结尾钩子","type":"text"}'
   '{"name":"隐喻命名","type":"text"}'
   '{"name":"情绪类型","type":"select","options":[{"name":"空间型"},{"name":"时间型外化"},{"name":"时间型"}]}'
   '{"name":"叙事角度","type":"select","options":[{"name":"A感知细节"},{"name":"B反向洞察"},{"name":"C矛盾张力"},{"name":"D功能归因"}]}'
   '{"name":"MJ提示词","type":"text"}'
   '{"name":"标签","type":"text"}'
   '{"name":"视觉特征","type":"text"}'
   '{"name":"发布状态","type":"select","options":[{"name":"待发布"},{"name":"已发布"}]}'
   '{"name":"点赞","type":"number"}'
   '{"name":"收藏","type":"number"}'
   '{"name":"评论","type":"number"}'
   '{"name":"分享","type":"number"}'
   '{"name":"复盘结果","type":"select","options":[{"name":"爆款"},{"name":"中等"},{"name":"质量差"}]}'
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
 if grep -q "^FEISHU_CONTENT_TABLE_ID=" "$ENV_FILE" 2>/dev/null; then
   sed -i.bak "s|^FEISHU_CONTENT_TABLE_ID=.*|FEISHU_CONTENT_TABLE_ID=$TABLE_ID|" "$ENV_FILE" && rm -f "${ENV_FILE}.bak"
 else
   echo "FEISHU_CONTENT_TABLE_ID=$TABLE_ID" >> "$ENV_FILE"
 fi

 echo "✅ 「内容资产库」已创建，TABLE_ID=$TABLE_ID 已写入 .env" >&2
 FEISHU_CONTENT_TABLE_ID="$TABLE_ID"
fi

# ── 写入记录 ─────────────────────────────────────────────────────────────────
lark-cli base +record-upsert \
 --base-token "$BASE_TOKEN" \
 --table-id "$FEISHU_CONTENT_TABLE_ID" \
 --as user \
 --json "$PAYLOAD" 2>&1

EXIT_CODE=$?
[ $EXIT_CODE -ne 0 ] && echo "❌ 飞书写入失败 (exit code: $EXIT_CODE)" >&2
exit $EXIT_CODE
