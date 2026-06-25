# Inner Voice · 心声

> **Give unnameable feelings a voice.** A Claude Code skill for Xiaohongshu emotional content creation. Paradox-driven metaphor mining, honest copywriting, Midjourney visual briefs. Built for real emotional resonance, not checklist compliance.
> **为说不清的情绪命名。** 悖论驱动的隐喻挖掘，诚实的写作，Midjourney 视觉表达。不是流水线，是一次创作对话。

[![Claude Code](https://img.shields.io/badge/Claude%20Code-Skill-6C4DFF?logo=anthropic)](https://claude.ai/code)
[![Platform](https://img.shields.io/badge/Platform-小红书%20(Xiaohongshu)-FE4C5C)](https://www.xiaohongshu.com)
[![GitHub stars](https://img.shields.io/github/stars/shasha1108/inner-voice?style=social)](https://github.com/shasha1108/inner-voice)

---

## What is this / 这是什么

This skill helps you create emotional content that feels written by a person, not a machine. It does one thing well: naming the feelings readers carry but can't express.

**Design philosophy / 设计哲学：少即是多。** 只保留必要的东西。不评分、不对比历史数据、不静默重写。写完给用户看，一起迭代。

### Core capabilities / 核心能力

- **Paradox-driven metaphor mining / 悖论驱动的隐喻挖掘** — Find the contradiction readers feel but can't name, give it a visible shape
- **Global-first trend research / 全球优先趋势调研** — Reddit/X catch early signals → Xiaohongshu validates penetration
- **THE ONE copywriting / 一句驱动** — Start from the single thing this piece is about, build outward through concrete scenes
- **ONE MASSIVE visual formula / 视觉公式** — Single physical entity + tiny figure + warm/cool color engine, Midjourney v8.1
- **Search-verified tags / 搜索验证标签** — Real-time Xiaohongshu search verification for every tag

---

## Pipeline / 创作流程

```
STEP 0: Trend research → STEP 1-2: Parse + emotion-medium check
 → STEP 3: Metaphor mining → ★ Human confirm A-1
 → STEP 4: Narrative angle cards → ★ Human confirm A-2
 → STEP 5: Write copy → Show to user → Iterate together
 → STEP 6: Visual brief → STEP 7: Tags
 → STEP 8: Light self-check → ★ User confirm
 → STEP 9: Persist → STEP 10: Data review
```

Two human checkpoints (metaphor + angle). Writing is a conversation, not a black box. No silent rewrites, no numeric scoring.

---

## Quick start / 快速开始

```bash
# Topic recommendation
/inner-voice 推荐

# Create from an emotion
/inner-voice 下班后的空虚感

# Data review
/inner-voice 复盘 安静的倦怠

# Write copy for existing images
/inner-voice 配文 /path/to/images/ 孤独
```

---

## Architecture / 项目架构

```
inner-voice/
├── SKILL.md  ← Core workflow
├── CLAUDE.md  ← Claude Code auto-load context
├── README.md  ← This file
│
├── assets/templates/  ← Output templates
├── assets/schemas/  ← Reference schemas
│
├── scripts/
│ ├── score.py ← Content scoring tool (archived)
│ ├── feishu-upsert.sh ← Feishu write
│ └── topic-upsert.sh ← Topic asset upsert
│
├── references/  ← Domain knowledge, loaded on demand
│ ├── trend-matrix.md
│ ├── account-dna.md
│ ├── visual-guide.md
│ ├── writing-techniques.md
│ ├── failure-patterns.md
│ ├── search-strategy.md
│ └── copywriting-mode.md
│
├── data/content-library.md  ← Content asset index
└── evals/evals.json  ← Test cases
```

---

## Related / 相关项目

- [emotional-content-studio](https://github.com/shasha1108/emotional-content-studio) — The predecessor. Feature-rich, scoring-driven. This skill was born from its lessons.
- [healing-visual-lab](https://github.com/shasha1108/healing-visual-lab) — Interactive healing H5 experiments
- [healing-space](https://github.com/shasha1108/healing-space) — Touch-driven healing H5 pages

---

## License / 许可证

MIT

---

<p align="center">
 <b>Inner Voice · 心声</b><br>
 让每一个说不清的情绪，都有被准确命名的可能。<br>
 <sub>Giving every unnameable feeling a voice.</sub>
</p>
