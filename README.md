# Inner Voice · 心声

> **Give unnameable feelings a voice.**
> Mine metaphors from paradox, build resonance through concrete scenes, make emotions visible in words and images. Not a production line. A creative conversation.
>
> **为说不清的情绪命名。**
> 从悖论中挖掘隐喻，用场景触发共鸣，让情绪在文字和画面里被看见。不是流水线，是一次创作对话。

[![Claude Code](https://img.shields.io/badge/Claude%20Code-Skill-6C4DFF?logo=anthropic)](https://claude.ai/code)
[![Platform](https://img.shields.io/badge/Platform-小红书图文创作-FE4C5C)](https://www.xiaohongshu.com)
[![GitHub stars](https://img.shields.io/github/stars/shasha1108/inner-voice?style=social)](https://github.com/shasha1108/inner-voice)

**领域标签** `情绪图文` `隐喻写作` `视觉隐喻` `Claude Code Skill` `内容创作` `情绪表达`

---

## What is this / 这是什么

帮你在小红书上创作有温度的情绪图文。核心只做一件事：**把读者感受到但说不清的情绪，用文字和画面准确命名。**

This skill creates emotional 图文 content for Xiaohongshu. One job: naming the feelings readers carry but can't put into words — through copy and images that feel human.

**设计哲学：少即是多。** STEP 6 提供可选质量校验（禁用词/结构/信号检查），但定位是格式诊断而非审美裁判。写完给用户看，一起迭代。每一条规则都需要为自己的存在辩护。

**底层逻辑：** 倾听 → 翻译 → 陪伴。倾听读者未说出口的情绪，翻译成他们能共鸣的画面和文字，在创作过程中始终陪伴而非替代用户的表达。

### 核心能力

**隐喻挖掘** — 从身体经验出发，找出读者感受到但无法命名的内在矛盾，转化为具象的视觉隐喻（漩涡、玻璃盒、废墟）。判断标准：读者看到的第一反应是"这就是我"，不是"这个比喻挺有意思"。

**场景化写作** — 从具体时刻开场（"周六下午两点，沙发上，手机扣着"），而非情绪标签词（"最近感到一阵疲惫"）。用"我们"叙事建立同盟感，不说教、不开处方、不替读者做结论。

**情绪视觉化** — 将隐喻转化为单帧画面：一个占画面 60%+ 的物理主体，加上微小的参照人物，让情绪在不依赖文字的情况下被一眼看见。文案和画面说同一件事。

**搜索验证标签** — 15 个标签分四层（入口词/垂类词/长尾词/形式标签），每个候选标签在小红书实时搜索验证，零搜索量标签直接移除。标签与正文语义一致性校验。

**趋势感知选题** — Reddit/X 捕捉全球情绪信号 → 小红书验证渗透度 → Pinterest 提取视觉风格方向。所有趋势判断实时调研产出，不做静态推荐。视觉色彩决策（Flow A + STEP 0）采用每选题实时 Pinterest 调研，不使用预设色板。

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

Flow E · 自动选题: 定时触发 → STEP 0 静默执行 → 筛选 10 方向 → 存入选题库 → 邮件汇总
```

两个人工确认点（隐喻 + 叙事角度）。写作是对话，不是黑箱。STEP 6 微修复静默执行，结构性失败路由回用户。

**按需加载：** 所有 references 仅在对应 STEP 触发时加载，不全量预加载。STEP 3 强制加载 `workflow-memory.md`；`success-patterns.md` 和 `failure-patterns.md` 由用户选择是否启用。

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

# 自动选题入库（Flow E · 定时任务）
/inner-voice 自动选题
```

---

## Architecture / 项目架构

```
inner-voice/
├── SKILL.md                  ← 核心工作流（5条流程，10个STEP）
├── CLAUDE.md                 ← Claude Code 自动加载上下文
├── README.md                 ← 本文件
│
├── conf/
│   └── schedule              ← 自动选题定时配置（HH:MM 格式，如 09:03）
│
├── assets/templates/          ← 输出模板
│   ├── metaphor-output.md    ← STEP 3 隐喻候选输出（A-1 确认点）
│   ├── angle-card.md         ← STEP 4 叙事角度卡片（A-2 确认点，A/B/C/D 四种）
│   ├── recommendation-card.md← STEP 0 选题推荐卡片（字段定义见 topic-upsert.sh）
│   └── alert-time-emotion.md ← STEP 2 时间型情绪告警（媒介匹配失败时触发）
│
├── scripts/
│   ├── feishu-upsert.sh       ← 飞书内容资产库写入 + 自动建表（19 字段）
│   └── topic-upsert.sh        ← 选题资产库写入 + 自动建表（16 字段）
│
├── references/                ← 领域知识库（按需加载）
│   ├── auto-pipeline.md       ← 流程 E 完整逻辑（定时 → 入库 → 邮件）
│   ├── trend-matrix.md        ← 趋势调研工具链
│   ├── account-dna.md         ← 账号人设 + 禁用句式
│   ├── visual-guide.md        ← 视觉Brief架构 + 质检
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

## 🔗 More from @shasha1108

| Repo | What |
|------|------|
| [healing-visual-lab](https://github.com/shasha1108/healing-visual-lab) | 交互式数字疗愈作品集——15 件 Three.js/WebGL 交互实验 |
| [healing-space](https://github.com/shasha1108/healing-space) | 触觉驱动的交互式疗愈 H5 生成器——GPU 流体、WebGL 着色器 |
| [pixel-bloom](https://github.com/shasha1108/pixel-bloom) | 像素艺术 × 毛玻璃美学——赛博养宠、电子水族箱 |
| [h5-publish-skill](https://github.com/shasha1108/h5-publish-skill) | 一键发布 H5 到 GitHub Pages——拖入文件夹即上线 |

---

## License / 许可证

MIT

---

<p align="center">
  <b>Inner Voice · 心声</b><br>
  让每一个说不清的情绪，都有被准确命名的可能。<br>
  <sub>Giving every unnameable feeling a voice.</sub>
</p>
