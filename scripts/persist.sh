#!/usr/bin/env bash
# Git commit + push for inner-voice skill
# 用法: bash scripts/persist.sh <emotion_theme> <content_type>
set -euo pipefail

SKILL_DIR="$(cd "$(dirname "$0")/.." && pwd)"
EMOTION="${1:-}"
CTYPE="${2:-}"

if [ -z "$EMOTION" ] || [ -z "$CTYPE" ]; then
 echo "用法: persist.sh <emotion_theme> <content_type>" >&2
 exit 1
fi

cd "$SKILL_DIR"

if ! git rev-parse --git-dir >/dev/null 2>&1; then
 echo "⏭ 不在 git 仓库中，跳过 git 同步"
 exit 0
fi

git add data/content-library.md references/workflow-memory.md 2>/dev/null || true

if git diff --cached --quiet; then
 echo "⏭ 无变更，跳过 git commit"
 exit 0
fi

COMMIT_MSG="content: 入库「${EMOTION}」(${CTYPE})"

git commit -m "$COMMIT_MSG"
git push origin main
echo "✅ 已 push: $COMMIT_MSG"
