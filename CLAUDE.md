# CLAUDE.md · Inner Voice

Auto-loaded by Claude Code when this skill repository is opened.

## SCOPE RULE（审计/分析时必须遵守）

> **确定 skill 文件范围用 `git ls-files`，禁止用 `find` / `ls -R` 扫描磁盘。**

## FEISHU RULE（飞书操作强制规则）

> **所有飞书操作通过 `lark-cli` CLI 执行。`lark-cli` 自带 OAuth 认证，Base 不存在时 `+base-create` 自动创建，Token/Table ID 由脚本自动写入 `.env`。**

## GIT WORKFLOW（防冲突规范）

> 此仓库会被多个设备/会话并发写入（本地创作 + Claude 修改），必须遵守以下规范防止冲突。

**每次开始工作前（Claude 必须执行）：**
1. `git status` — 确认工作区是否干净
2. `git fetch` — 获取 remote 最新状态，检查是否有远端新提交
3. 若工作区有未提交修改 → 先告知用户，请用户确认后再开始操作
4. 若 remote 有新提交 → 先 `git pull --rebase`（工作区干净时），再开始修改

**提交后询问推送（Claude 必须执行）：**
- commit 完成后，**必须询问用户是否推送**，等待确认后再执行 `git push`
- 不得在未经用户确认的情况下自动推送
- push 前再次 `git status` 确认只 stage 了本次修改的文件，不要用 `git add -A`

**禁止事项：**
- ❌ 在脏工作区（有未提交文件）直接 commit + push，会触发 stash 链式问题
- ❌ 用 `git stash` 绕过预存在的未提交修改——stash pop 在多文件冲突场景极易失败
- ❌ 用 `git stash --include-untracked` 处理 untracked 文件冲突——remote 新增同名文件时 stash pop 必然失败

**冲突已发生时的恢复步骤：**
```bash
git stash drop                    # 丢弃失败的 stash（如果 stash pop 已失败）
git status                        # 确认冲突文件
# 手动解决冲突后：
git add <resolved-files>
git commit -m "resolve merge conflicts"
```
