# 流程 D：数据复盘

> 触发：`/inner-voice 复盘 <图文地址>`
> 加载时机：触发流程 D 时必读全部

---

## 流程 D：数据复盘

> 触发：`/inner-voice 复盘 <图文地址>`
>
> 独立流程，不属于 STEP 管道。纯粹用来复盘数据并记录经验文件。

### 1. 数据采集

通过 `opencli xiaohongshu post` 或用户直接提供，获取：
- 点赞 / 收藏 / 评论 / 分享
- 前 20 条评论内容
- 搜索排名（如有）

### 2. 评论分析

分析评论质量和情绪倾向：
- 读者是被"说中了"还是只是"觉得好看"？
- 评论是情绪共鸣（"我也是..."）还是围观（"好看""学到了"）？
- 有没有读者补充了自己的具体场景？

### 3. 三级分流

| 级别 | 标准 | 动作 |
|------|------|------|
| **爆款** | 点赞>200 / 收藏>100 / 评论>50（满足任一） | → 提取可复用基因 → 写入 `references/success-patterns.md` + 更新飞书内容表状态 |
| **质量差** | 点赞<20 **且** 收藏<10 **且** 评论<5（全部满足） | → 对照失败模式逐一诊断 → 写入 `references/failure-patterns.md` |
| **中等** | 介于两者之间 | → 告知用户数据概况，不做记录 |

### 4. 更新飞书内容表（爆款/质量差时）

> 仅当内容已在 STEP 9 存入飞书「资产库 · 内容资产库」时执行。未存过则跳过飞书更新，复盘结论仅写入本地经验文件（success-patterns.md / failure-patterns.md）。

```
1. 询问用户："如在飞书内容表中更新复盘数据，请提供笔记ID（格式：YYYYMMDDNN）："
2. 用户提供笔记ID后，组装 JSON payload（笔记ID + 点赞/收藏/评论/分享 + 发布状态="已发布" + 复盘结果）。字段定义 → Read `scripts/feishu-upsert.sh` 部分更新格式。
3. 执行:
   lark-cli base +record-upsert \
     --base-token $FEISHU_BASE_TOKEN \
     --table-id $FEISHU_CONTENT_TABLE_ID \
     --record-id <笔记ID对应的record_id> \
     --json '<json_payload>'
   （先通过 +record-search 用笔记ID查找 record_id，再 upsert 更新）
```

### 5. 爆款路径

```
1. 主动提示："这篇达到爆款标准（点赞X/收藏X/评论X），是否提取爆款基因到 success-patterns.md？"
2. 提取可复用基因（隐喻结构/叙事角度/视觉特征/标题模式/行动锚点）→ 写入 success-patterns.md
3. 执行"更新飞书内容表"步骤
```

### 6. 质量差路径

```
1. 加载 references/failure-patterns.md
2. 对照失败案例表逐一比对：
   - □ 封面情绪方向是否与标题一致？
   - □ 是否混入了摄影风（破坏插画标识）？
   - □ 视觉主体是否透明化（鬼魂/泥浆质感）？
   - □ 是否用了 Magritte 式人体空洞 cutout（概念层面 disturbing）？
   - □ 文案是否"先给概念再解释"（读者被分析而非陪伴）？
   - □ 标题是否有密语感（还是内容介绍）？
   - □ 矛盾句是否强行拼凑（「不不」相邻/多重从句叠加）？
   - □ 隐喻是"命名中心感受"还是"命名情绪机制"？
   - □ 隐喻是否通过了前置视觉主体性测试？
   - □ 图文是否使用了不同隐喻？
   - □ 配色是否忽视停滑力、只匹配情绪？
3. 输出失败原因诊断（不超过3条主因）
4. 提取创作经验教训（1-2条可操作的避免方法）
5. 追加写入 failure-patterns.md（新案例 + 根因 + 教训）
6. 执行"更新飞书内容表"步骤
```

### 7. 复盘完成后：Git 持久化

```
若 success-patterns.md 或 failure-patterns.md 有变更：
  1. 提示用户："复盘文件有更新，是否提交到 GitHub？"
  2. 用户确认后：
     git status → git fetch → git add <变更文件> → git commit
     → 询问用户是否推送 → git push origin main
若无变更：跳过
```
