# CLAUDE.md · Inner Voice

This file is auto-loaded by Claude Code when this skill repository is opened.

## WHAT THIS IS
A Claude Code skill for Xiaohongshu emotional content creation. Names feelings readers can't express — through metaphor, concrete scenes, and honest writing. Not a quality control system. A creative conversation.

## WHEN THIS SKILL TRIGGERS
- Content creation for Xiaohongshu
- Emotional themes (anxiety, burnout, loneliness, emptiness, etc.)
- Account operations (what to post today, topic ideas, no inspiration)
- Data review (post performance analysis)
- Image copywriting (write text for existing images)

## HOW TO NAVIGATE
1. `SKILL.md` — Core workflow (10 STEPs: 0→1→2→3→4→5→6→7→8→9→10)
2. `references/trend-matrix.md` — Trend research toolchain + Pinterest methodology
3. `references/account-dna.md` — Account persona, voice, banned patterns
4. `references/visual-guide.md` — Midjourney Prompt architecture + anti-patterns
5. `references/writing-techniques.md` — Copywriting techniques reference
6. `data/content-library.md` — Index of all created content

## KEY CONVENTIONS
- Design philosophy: less is more. Every rule must justify its existence.
- 底层逻辑 (only mandatory read): 倾听 → 翻译 → 陪伴
- Two human checkpoints: A-1 (metaphor) and A-2 (narrative angle)
- After writing, show draft to user immediately — iterate together
- No numeric scoring. Lightweight qualitative self-check before final output.
- References loaded only when needed, not all at once
- Visual color decisions use per-topic real-time Pinterest research

## GIT WORKFLOW（防冲突规范）

> 此仓库会被多个设备/会话并发写入，必须遵守以下规范防止冲突。

**每次开始工作前：**
1. `git status` — 确认工作区是否干净
2. `git fetch` — 检查远端是否有新提交
3. 若工作区有未提交修改 → 先告知用户确认
4. 若 remote 有新提交 → 先 `git pull --rebase`（工作区干净时）

**提交后询问推送：**
- commit 后**必须询问用户是否推送**，确认后再 `git push`
- 不得在未经确认的情况下自动推送
- push 前 `git status` 确认只 stage 了本次修改的文件

**禁止：**
- ❌ 在脏工作区直接 commit + push
- ❌ 用 `git stash` 绕过预存在的未提交修改
- ❌ 用 `git stash --include-untracked` 处理 untracked 文件冲突
