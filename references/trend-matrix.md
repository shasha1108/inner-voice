# 情绪趋势调研工具链

> **使用方法：** STEP 0 趋势感知时加载本文件。不提供任何静态结论——所有趋势判断、范式方向、选题热度均由 STEP 0 实时调研产出。

## 全球情绪趋势（强制 · 先于简中源执行）

| 用途 | 工具 | 说明 |
|------|------|------|
| 全球大众情绪 | `opencli reddit hot -f json --limit 20` | Reddit 全站热点，捕捉大众情绪方向 |
| 情绪命名早期信号 | `opencli reddit hot --subreddit emotionalintelligence -f json --limit 15` | 捕捉"尚未被简中命名"的情绪表述 |
| 心理健康趋势 | `opencli reddit hot --subreddit mentalhealth -f json --limit 15` | 焦虑/抑郁/倦怠等临床级情绪趋势 |
| 成人生活痛点 | `opencli reddit hot --subreddit Adulting -f json --limit 15` | 职场倦怠/独立生活/身份撕裂等 |
| 个人倾诉 | `opencli reddit hot --subreddit self -f json --limit 15` | 真实个人困境，高共鸣素材源 |
| X实时话题 | `opencli twitter trending -f json` | 实时情绪话题脉冲，比 Reddit 快 1-2 天但噪音更大 |

> **全球→简中传递逻辑：** Reddit 某情绪表述获 100+ upvote **且** X 上相关话题在上升 → 高置信度早期信号。预计 2-6 周后渗透到简中。小红书搜索验证确认渗透程度：已渗透 → 直接用；未渗透 → 抢占命名权。

## 简中舆论趋势（强制）

| 用途 | 工具 | 说明 |
|------|------|------|
| 中文舆论热搜 | `opencli weibo hot -f json` | 含分类和热度值 |
| 深度讨论趋势 | `opencli zhihu hot -f json` | 知识社区，长尾话题 |
| 年轻群体热点 | `opencli bilibili hot -f json` | B站内容热点 |
| 搜索量验证 | `opencli xiaohongshu search "<关键词>" -f json --limit 10` | 返回前 N 条内容的点赞/作者/发布时间 |
| 竞品空白 | 分析前 10 条内容质量 | 同质化=蓝海；个人创作者少=机会 |

## Pinterest 视觉风格调研（强制 · 每个选题必须包含）

| 用途 | 工具 | 说明 |
|------|------|------|
| 配色参考 | WebSearch: "Pinterest {topic} illustration color palette trending" | 针对当前选题实时搜索热门配色 |
| 构图光影 | WebSearch: "Pinterest {mood} illustration composition lighting detail" | 搜索构图手法和光影处理的创新点 |
| 差异化机会 | 对比 Pinterest 高保存图 vs 小红书热门封面 | Pinterest 有但小红书尚未泛滥的视觉方向 = 抢跑窗口 |

> **Pinterest 领先指标逻辑：** Pinterest 用户保存行为反映的是**向往和审美偏好**（超前 3-6 个月），小红书热门封面反映的是**已被验证的爆款公式**（已经过时）。视觉方向应该对齐 Pinterest 领先指标，而非小红书滞后指标。

## 数据回收

| 用途 | 工具 | 说明 |
|------|------|------|
| 数据看板 | 小红书创作者中心 | 已发布笔记的数据看板 |

---

## Pinterest 视觉调研方法论

> **原则：视觉趋势变化极快，不引用固定年度色盘。** 每次选题方向确定后，去 Pinterest 实时搜索该题材当前最流行的插画风格。调研结果仅用于本篇创作参考，不跨篇复用。

### 搜索策略

根据选题定制搜索词（替换 `{topic}` 为实际选题关键词）：

```
WebSearch: "Pinterest {topic} illustration art style trending color palette composition"
WebSearch: "Pinterest {topic} emotional illustration lighting detail composition popular pins"
```

搜索重点：
- **配色**：当前热门作品反复出现的颜色组合 + 具体 Hex 值 → 写入 `pinterest_colors`
- **构图**：当前热门的构图手法（如单一暖光源剪影、负空间、雾化景深、极简留白等）→ 写入 `pinterest_composition_lighting`
- **光影**：光源方向、冷暖对比方式、是否有标志性光影手法 → 同上
- **差异化机会**：Pinterest 已有但小红书尚未泛滥的方向 → 写入 `pinterest_vs_xhs_gap`

### 输出格式（写入选题推荐卡片）

```
pinterest_colors: [从搜索中提取的具体配色 + Hex]
pinterest_composition_lighting: [构图和光影处理的创新点]
pinterest_vs_xhs_gap: [Pinterest 有但小红书少的视觉方向]
```

> 以上数据仅用于当前选题的视觉 Brief。下个选题重新搜索——不同情绪/主题的视觉方向完全不同。
