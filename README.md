# Inner Voice · 心声

> **Give unnameable feelings a voice.**
> A Claude Code skill for Xiaohongshu 图文创作 — paradox-driven metaphor mining, honest copywriting paired with Midjourney visuals. Not a production line. A creative conversation.
>
> **为说不清的情绪命名。**
> 悖论驱动的隐喻挖掘，诚实的写作，Midjourney 视觉表达。不是流水线，是一次创作对话。

[![Claude Code](https://img.shields.io/badge/Claude%20Code-Skill-6C4DFF?logo=anthropic)](https://claude.ai/code)
[![Platform](https://img.shields.io/badge/Platform-小红书图文创作-FE4C5C)](https://www.xiaohongshu.com)
[![GitHub stars](https://img.shields.io/github/stars/shasha1108/inner-voice?style=social)](https://github.com/shasha1108/inner-voice)

**领域标签** `情绪图文` `隐喻写作` `Midjourney插画` `Claude Code Skill` `内容创作` `情绪表达` `视觉隐喻`

---

## What is this / 这是什么

帮你在小红书上创作有温度的情绪图文。核心能力只有一个：**把读者感受到但说不清的情绪，用文字和画面准确命名。**

This skill creates emotional 图文 content for Xiaohongshu. It does one thing: naming the feelings readers carry but can't put into words — through copy and visuals that feel like a person made them.

**设计哲学：少即是多。** 不评分、不对比历史数据、不静默重写。写完给用户看，一起迭代。每一条规则都需要为自己的存在辩护。

### 核心能力 / Core capabilities

- **悖论驱动的隐喻挖掘** — 找出读者感受到但无法命名的矛盾，给它一个能被看见的形状
- **全球优先趋势调研** — Reddit/X 捕捉早期信号 → 小红书验证渗透度 → Pinterest 提取视觉风格
- **THE ONE 写作法** — 从"这篇唯一要说的一件事"出发，用具体场景展开，不用抽象标签
- **ONE MASSIVE 视觉公式** — 单一物理实体 + 微小人物 + 冷暖色彩引擎，Midjourney v8.1
- **搜索验证标签** — 每个候选标签实时搜索验证，零搜索量标签直接移除

---

## Pipeline / 创作流程

```
Flow A · 完整创作:
  STEP 0: 趋势调研 → STEP 1-2: 解析输入 + 媒介匹配
  → STEP 3: 隐喻挖掘（加载历史经验）→ ★ 确认点 A-1
  → STEP 4: 叙事角度卡片 → ★ 确认点 A-2
  → STEP 5: 写作文案 → 展示初稿 → 迭代修改
  → STEP 6: 文案质量校验 → STEP 7: 标签生成 + 搜索验证
  → STEP 8: 视觉Brief + 视觉质检 → ★ 最终确认
  → STEP 9: 存入飞书内容表

Flow B · 配文: 图片解读 → 隐喻提取 → STEP 4→5→6→7 → ★ 确认 → STEP 9

Flow C · 选题推荐: STEP 0 → 推荐卡片 → 可选存入飞书选题库

Flow D · 数据复盘: 采集数据 → 三级分流 → 爆款→success / 差→failure
```

两个人工确认点（隐喻 + 叙事角度）。写作是对话，不是黑箱。不静默重写，不打分。

---

## Quick start / 快速开始

```bash
# 选题推荐（Flow C）
/inner-voice 推荐

# 从情绪词开始完整创作（Flow A）
/inner-voice 下班后的空虚感

# 已有图片，只写配文（Flow B）
/inner-voice 配文 /path/to/images/ 孤独

# 数据复盘（Flow D）
/inner-voice 复盘 https://www.xiaohongshu.com/explore/xxx
```

---

## Architecture / 项目架构

```
inner-voice/
├── SKILL.md                  ← 核心工作流（4条流程，10个STEP）
├── CLAUDE.md                 ← Claude Code 自动加载上下文
├── README.md                 ← 本文件
│
├── assets/templates/          ← 输出模板（隐喻输出/角度卡片/推荐卡片/告警）
│
├── scripts/
│   ├── feishu-upsert.sh       ← 飞书内容表写入
│   └── topic-upsert.sh        ← 选题资产库写入
│
├── references/                ← 领域知识库（按需加载）
│   ├── trend-matrix.md        ← 趋势调研工具链
│   ├── account-dna.md         ← 账号人设 + 禁用句式
│   ├── visual-guide.md        ← MJ Prompt架构 + 视觉质检
│   ├── writing-techniques.md  ← 写作技法（钩子/CTA/修辞）
│   ├── exemplars.md           ← 中文语感参照库
│   ├── quality-signals.md     ← 文案质量校验（3校验 + 5结构信号）
│   ├── search-strategy.md     ← 搜索优化 + 标签验证
│   ├── copywriting-mode.md    ← 配文模式完整流程
│   ├── success-patterns.md    ← 爆款基因库
│   ├── failure-patterns.md    ← 失败模式库
│   └── workflow-memory.md     ← 创作经验便签
```

---

## Related / 相关项目

- [healing-visual-lab](https://github.com/shasha1108/healing-visual-lab) — 交互式疗愈 H5 实验
- [healing-space](https://github.com/shasha1108/healing-space) — 触觉驱动的治愈网页

---

## License / 许可证

MIT

---

<p align="center">
  <b>Inner Voice · 心声</b><br>
  让每一个说不清的情绪，都有被准确命名的可能。<br>
  <sub>Giving every unnameable feeling a voice.</sub>
</p>
