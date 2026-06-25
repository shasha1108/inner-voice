#!/usr/bin/env bash
# 飞书多维表格写入
# 用法: bash scripts/feishu-upsert.sh '<json_payload>'
# JSON payload 需包含: 生成时间, 情绪主题词, 内容类型, 笔记标题, 正文文案, 结尾钩子,
#  MJ提示词组, 可灵Brief, 标签, 质量评分, 质检状态, 叙事角度, 选题来源, 发布状态
set -euo pipefail

# Load .env if present (local secrets, not committed to git)
SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
[ -f "$SCRIPT_DIR/../.env" ] && source "$SCRIPT_DIR/../.env"

BASE_TOKEN="${FEISHU_BASE_TOKEN:?FEISHU_BASE_TOKEN not set — copy .env.example to .env and fill in values}"
TABLE_ID="${FEISHU_TABLE_ID:?FEISHU_TABLE_ID not set — copy .env.example to .env and fill in values}"
PAYLOAD="${1:-}"

if [ -z "$PAYLOAD" ]; then
 echo "用法: feishu-upsert.sh '<json_payload>'" >&2
 exit 1
fi

lark-cli base +record-upsert \
 --base-token "$BASE_TOKEN" \
 --table-id "$TABLE_ID" \
 --as user \
 --json "$PAYLOAD" 2>&1

EXIT_CODE=$?
if [ $EXIT_CODE -ne 0 ]; then
 echo "❌ 飞书写入失败 (exit code: $EXIT_CODE)" >&2
fi
exit $EXIT_CODE
