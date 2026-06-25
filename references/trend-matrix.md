# 情绪趋势调研工具链

> **使用方法：** STEP 0 趋势感知时加载本文件。包含完整的工具命令、分析方法、离线回退方案。不提供任何静态结论——所有趋势判断、范式方向、选题热度均由实时调研产出。

---

## 前置验证

执行任何调研命令前，先验证工具链可用性：

```
opencli doctor
```

若返回任意 FAIL：
→ 告知用户："趋势调研工具不可用，将基于飞书选题资产库推荐选题。"
→ 跳转到下方「离线回退方案」。
→ 离线模式产出的推荐卡片标注：非实时数据 · 来源：选题资产库。

---

## 全球优先原则

情绪趋势从西方向简中互联网传递的周期约为 2-6 周。仅扫描简中源 = 永远在追尾。必须同时扫描全球源（Reddit/X）捕捉早期信号，再用小红书验证是否已渗透到简中。

---

## 1. 全球情绪趋势扫描（强制 · 先于简中源执行）

### Reddit — 捕捉大众情绪方向 + 早期命名信号

```
# Reddit 全站热点
opencli reddit hot -f json --limit 20

# 情绪/心理垂直社区
opencli reddit hot --subreddit emotionalintelligence -f json --limit 15
opencli reddit hot --subreddit mentalhealth -f json --limit 15
opencli reddit hot --subreddit Adulting -f json --limit 15
opencli reddit hot --subreddit self -f json --limit 15
```

**分析重点：** 哪些情绪表述在反复出现（如"feel deeply without falling apart""I just wanna sleep""losing my spark"）→ 这些是**尚未被简中互联网命名的情绪种子**。

### X/Twitter — 捕捉实时情绪话题脉冲

```
opencli twitter trending -f json
```

X 上的情绪话题往往比 Reddit 快 1-2 天，但噪音更大。

**交叉验证原则：** Reddit 某情绪表述获 100+ upvote **且** X 上相关话题在上升 → 高置信度早期信号。预计 2-6 周后渗透到简中。小红书搜索验证确认渗透程度：已渗透 → 直接用；未渗透 → 抢占命名权。

---

## 2. 简中舆论趋势扫描（强制）

```
opencli weibo hot -f json    → 中文舆论热搜
opencli zhihu hot -f json    → 知识社区深度讨论趋势
opencli bilibili hot -f json → 年轻群体热点
```

**交叉分析：** 全球源捕捉的情绪种子，在简中平台是否有对应热搜/热榜话题？
→ 有 = 已渗透，可直接用。
→ 无 = 早期机会，可抢占命名权。

---

## 3. 小红书搜索验证

对候选关键词逐一在小红书搜索，获取真实搜索热度：

```
opencli xiaohongshu search "<关键词>" -f json --limit 10
```

**分析：** 前 10 条内容的点赞量、内容类型（个人创作者 vs 品牌号）、是否存在同质化。判断红海/蓝海。

**竞品空白判断：** 同质化严重 = 蓝海机会（用差异化切入）；个人创作者少 = 竞争低。

---

## 4. Pinterest 视觉风格调研（强制 · 每个选题方向必须包含）

> 情绪插画的视觉竞争力 50% 在文案、50% 在图。图的方向不只看小红书——小红书的视觉供给严重滞后于 Pinterest。Pinterest 上的情绪插画保存数据是**领先指标**（超前 3-6 个月），小红书热门封面是**滞后指标**（已被验证的爆款公式，已经过时）。
>
> **本步骤的目标不是引用一套固定的年度色盘，而是针对当前选题方向，去 Pinterest 实时搜索：这个题材当下最流行的插画风格是什么？颜色怎么用的？构图有什么创新？光影细节怎么处理的？**

### 搜索策略

根据选题定制搜索词（替换 `{topic}` 为实际选题关键词）：

```
WebSearch: "Pinterest {topic} illustration art style trending color palette composition"
WebSearch: "Pinterest {topic} emotional illustration lighting detail composition popular pins"
```

搜索重点：
- **配色**：当前热门作品反复出现的颜色组合 + 具体 Hex 值
- **构图**：当前热门的构图手法（如单一暖光源剪影、负空间、雾化景深、极简留白等）
- **光影**：光源方向、冷暖对比方式、是否有标志性光影手法
- **差异化机会**：Pinterest 已有但小红书尚未泛滥的方向

### 必须提取的 3 项视觉元数据

| 元数据 | 说明 | 用途 |
|--------|------|------|
| `pinterest_colors` | 搜索到的热门作品中反复出现的配色方案（具体 Hex 值 + 使用场景） | 本篇视觉 Brief 的配色参考 |
| `pinterest_composition_lighting` | 搜索到的构图手法和光影处理创新点（如单一暖光源、剪影负空间、雾化景深等） | 本篇封面构图的差异化参考 |
| `pinterest_vs_xhs_gap` | Pinterest 已有但小红书尚未泛滥的视觉方向 | 差异化机会：从 Pinterest 领先指标中抢跑 |

> ⚠️ 以上数据针对**当前选题**实时调研所得。不同选题、不同情绪温度的视觉方向完全不同——不要跨篇复用，不要用一套固定色盘套所有创作。

---

## 5. 行动锚点采集（D 型角度专用 · 趋势扫描时顺带采集）

当扫描 Reddit/X 评论区或小红书搜索结果时，注意用户自发提到的具体调节方式。这些是读者亲测有效的"行动锚点"——比任何专家建议更有说服力。

**提取条件（同时满足）：**
- 用户以第一人称描述（"我试了X，发现Y"）——不是转发科普
- 包含具体参数（时间/次数/动作）——不是泛化建议
- 情绪方向与当前选题相关

**采集格式：** `[具体方法] | 来源：[平台+帖子关键词] | 为什么可信：[一句话]`

示例：
- 「把手机调成灰度模式，三天后焦虑感明显下降」| Reddit r/digitalminimalism | 用户亲测，含具体参数
- 「每天下班后不开灯坐15分钟，让感官自己关掉」| X 回复高赞 | 体感操作，可复现

采集的行动锚点随选题推荐一起输出，在 STEP 5 写作 Type D 角度时作为可选结尾材料。

---

## 6. 热点元数据提取

调研完成后，为每个选题方向提取以下元数据（写入后续流程约束）：

| 字段 | 说明 |
|------|------|
| `trend_emotion_temp` | 这个趋势的**情绪温度**（轻量幽默 / 温暖治愈 / 严肃沉重 / 冷静克制） |
| `trend_visual_anchor` | 什么具体的**视觉元素**让用户能 3 秒识别这个热点？ |
| `trend_spread_reason` | 用户为什么**转发**这个热点？（因为好笑/因为被戳中/因为可爱/因为被理解） |
| `trend_global_source` | 这个趋势**最先出现在哪个平台**？（Reddit / X / Pinterest / 简中原创）→ 用于判断所处传播周期 |

> ⚠️ `trend_emotion_temp` 是后续所有步骤的硬约束。热点是可爱的 → 内容不能是沉重暗黑的。热点是幽默的 → 全篇温度必须匹配。
> ⚠️ `pinterest_colors` 是 STEP 8 配色的硬约束。Pinterest 色盘决定了封面在信息流里的冷暖光引擎基调。

---

## 离线回退方案

当 `opencli doctor` 返回 FAIL 时：

1. 加载 `references/account-dna.md` 情绪库
2. 查询飞书选题资产库：
   ```
   lark-cli base record-list \
     --base-token "$FEISHU_BASE_TOKEN" \
     --table-id "$FEISHU_TOPIC_TABLE_ID" \
     --as user
   ```
3. 若飞书也连不上 → 告知用户无可用数据源，要求用户直接指定情绪主题词
4. 基于飞书记录输出离线推荐卡片（标注：非实时数据 · 来源：选题资产库）。跳过后续 opencli 命令。
