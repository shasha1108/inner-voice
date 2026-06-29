<a id="top"></a>

<div align="center">

<h1>Inner Voice · 心声</h1>

<p><em>为说不清的情绪命名——隐喻驱动的情绪内容创作 Skill，专为小红书图文设计。</em></p>

<p>
  <a href="https://github.com/shasha1108/inner-voice/stargazers"><img src="https://img.shields.io/github/stars/shasha1108/inner-voice?style=for-the-badge&color=6C4DFF" alt="Stars"></a>
  <a href="LICENSE"><img src="https://img.shields.io/badge/License-MIT-yellow.svg?style=for-the-badge" alt="License"></a>
  <a href="https://github.com/shasha1108/inner-voice"><img src="https://img.shields.io/badge/Claude%20Code-Skill-6C4AB6?style=for-the-badge&logo=anthropic&logoColor=white" alt="Claude Code Skill"></a>
  <a href="#"><img src="https://img.shields.io/badge/Platform-小红书-FE4C5C?style=for-the-badge" alt="小红书"></a>
</p>

<p>
  <a href="#-快速开始">快速开始</a> ·
  <a href="#-能力矩阵">能力矩阵</a> ·
  <a href="#-创作流程">创作流程</a> ·
  <a href="#-项目结构">项目结构</a> ·
</p>

</div>

---

<details open>
<summary><strong>📑 目录</strong></summary>

- [概述](#-概述)
- [快速开始](#-快速开始)
- [五种创作流程](#-五种创作流程)
- [能力矩阵](#-能力矩阵)
- [概念种子](#-概念种子)
- [工作原理](#-工作原理)
- [质量门禁](#-质量门禁)
- [技术栈](#-技术栈)
- [项目结构](#-项目结构)
- [相关项目](#-相关项目)
- [参与贡献](#-参与贡献)
- [许可](#-许可)

</details>

---

## 📖 概述

**inner-voice** 是一个 Claude Code Skill，帮你在小红书上创作有温度的情绪图文。核心只做一件事：**把读者感受到但说不清的情绪，用文字和画面准确命名。**

它不是内容生产线，而是一次创作对话——倾听读者未说出口的情绪，翻译成他们能共鸣的画面和文字，在创作过程中始终陪伴而非替代用户的表达。

| 能力 | 说明 |
|------|------|
| 🔍 **隐喻挖掘** | 从身体经验出发，找出读者感受到但无法命名的内在矛盾，转化为具象视觉隐喻（漩涡、玻璃盒、废墟） |
| ✍️ **场景化写作** | 从具体时刻开场（"周六下午两点，沙发上，手机扣着"），用"我们"叙事建立同盟感，不评判、不开处方 |
| 🎨 **情绪视觉化** | 隐喻转化为单帧画面：占画面 60%+ 的物理主体 + 微小参照人物，图文说同一件事 |
| 🏷️ **搜索验证标签** | 15 个标签分四层（入口词/垂类词/长尾词/形式标签），小红书实时搜索验证，零搜索量直接移除 |
| 📊 **趋势感知选题** | Reddit/X 捕捉全球情绪信号 → 小红书验证渗透度 → Pinterest 提取视觉方向，所有判断实时调研 |

> **设计哲学：少即是多。** 创作流程中只有 2 个人工确认点（隐喻 + 叙事角度），其余环节静默执行或在对话中迭代。每一条规则都需要为自己的存在辩护。

<p align="right"><sub><a href="#top">↑ 回到顶部</a></sub></p>

---

## 🚀 快速开始

### 前提

- 已安装 [Claude Code](https://claude.ai/code)
- inner-voice skill 已在你的 skills 目录中

### 五种使用方式

```
# 从情绪词开始完整创作（Flow A）
/inner-voice 下班后的空虚感

# 已有图片，只写配文（Flow B）
/inner-voice 配文 ~/Desktop/新作/ 孤独

# 选题推荐（Flow C）
/inner-voice 推荐

# 数据复盘（Flow D）
/inner-voice 复盘 https://www.xiaohongshu.com/explore/xxx

# 自动选题入库（Flow E · 定时任务）
/inner-voice 自动选题
```

### 更多灵感

```
/inner-voice 焦虑
/inner-voice 配文 ~/Desktop/今天拍的/         # 不指定主题，AI 从图片中提取
/inner-voice 明明很累但睡不着的感觉
/inner-voice 推荐                               # 获取 10 个选题方向
```

> 💡 **情绪词越具体，创作越精准。** 与其说"焦虑"，不如说"周日晚上那种说不清的烦躁"。inner-voice 擅长的是**命名**——把模糊的感受变成读者一看就懂的句子。

<p align="right"><sub><a href="#top">↑ 回到顶部</a></sub></p>

---

## 🔀 五种创作流程

| 流程 | 触发 | 做什么 | 确认点 |
|------|------|--------|--------|
| 🔵 **Flow A** 完整创作 | `/inner-voice <情绪词>` | 趋势调研 → 隐喻挖掘 → 叙事角度 → 文案写作 → 质检 → 标签 → 视觉Brief → 存入飞书 | 隐喻 + 叙事角度 |
| 🟢 **Flow B** 配文模式 | `/inner-voice 配文 <图> [主题]` | 图片解读 → 隐喻提取 → 叙事角度 → 文案 → 质检 → 标签 → 存入飞书 | 叙事角度 |
| 🟡 **Flow C** 选题推荐 | `/inner-voice 推荐` | 趋势调研 → 生成推荐卡片 → 可选存入选题库 | 推荐卡片 |
| 🟣 **Flow D** 数据复盘 | `/inner-voice 复盘 <图文地址>` | 采集数据 → 三级分流（爆款→success / 差→failure / 中→告知） | 分流结果 |
| 🟠 **Flow E** 自动选题 | `/inner-voice 自动选题`（定时） | 静默执行 STEP 0 → 筛选 10 方向 → 存入选题库 → 邮件汇总 | 邮件汇总 |

<p align="right"><sub><a href="#top">↑ 回到顶部</a></sub></p>

---

## ✨ 能力矩阵

| | 能力 | 说明 |
|---|------|------|
| 🔍 | **隐喻挖掘（Metaphor Mining）** | 从悖论中挖掘隐喻——"不是事情太多，是每件事都在脑子里同时响"。判断标准：读者第一反应是"这就是我"，不是"这个比喻挺有意思" |
| ✍️ | **场景化写作（Scene Writing）** | 用具体时刻开场，不用情绪标签词。用"我们"叙事建立同盟感，不说教、不开处方、不替读者做结论 |
| 🎨 | **情绪视觉化（Visual Metaphor）** | 隐喻转化为单帧画面——物理主体占画面 60%+，微小参照人物衬托尺度，图文说同一件事 |
| 🏷️ | **搜索验证标签（SEO Tags）** | 15 个标签分四层，每个候选标签在小红书实时搜索验证，零搜索量直接移除，标签与正文语义一致性校验 |
| 📊 | **趋势感知选题（Trend Sensing）** | Reddit/X 全球情绪信号 → 小红书渗透度验证 → Pinterest 视觉风格提取，全实时调研，不做静态推荐 |
| 🔄 | **按需加载（Progressive Disclosure）** | 所有 references 仅在对应 STEP 触发时加载，不全量预加载。SKILL.md 硬上限 400 行 |
| 📋 | **飞书资产管理** | 内容资产库（19 字段）+ 选题资产库（16 字段），自动建表、自动写入 |
| ✅ | **文案质量校验** | 三层校验（禁用词/结构/信号），微修复静默执行，结构性失败路由回用户 |

<p align="right"><sub><a href="#top">↑ 回到顶部</a></sub></p>

---

## 🌱 概念种子

> 在进入隐喻挖掘之前，先找到这篇文章**真正在说什么**。情绪词是入口，概念种子是深度——那个不直说但暗中驱动全文的概念锚点。

| 情绪词 | 表面说法 | 概念种子（本质困境） |
|--------|----------|---------------------|
| 焦虑 | "事情太多了" | **"不是事情太多，是每件事都在脑子里同时响"** |
| 孤独 | "没人理解我" | **"不是没有人在身边，是没有人在你的频率里"** |
| 倦怠 | "太累了" | **"不是身体累了，是'维持正常'本身就已经竭尽全力"** |

概念种子决定隐喻方向、叙事角度、以及读者看完记住什么。它不是装饰——是整篇文章的地基。

### 底层逻辑（每次写作前读一遍）

- **给刺激，不给体验**：提供具体场景和细节，让读者自己产生感受——不替读者完成体验，不管理感受
- **同行者，不是医生**：命名 + 归因 + 见证 + 重框；禁用处方式句式
- **图文高配**：图停滑，文留人；两者说同一件事

<p align="right"><sub><a href="#top">↑ 回到顶部</a></sub></p>

---

## ⚙️ 工作原理

### Flow A 完整创作管线

```
STEP 0          STEP 1-2        STEP 3          ★ 确认A-1    STEP 4          ★ 确认A-2
趋势调研        解析输入        隐喻挖掘                     叙事角度卡片
──────→        ──────→        ──────→        ──────→      ──────→        ──────→
Reddit/X       情绪词提取      加载历史经验    用户确认       A/B/C/D 四种    用户确认
Pinterest      媒介匹配判定    悖论→隐喻       作品方向      角度选择
                (图文/视频)    概念种子

STEP 5          STEP 6          STEP 7          STEP 8          ★ 最终确认    STEP 9
文案写作        质量校验        标签生成         视觉Brief                    飞书存储
──────→        ──────→        ──────→        ──────→        ──────→      ──────→
展示初稿        三层校验        四层标签         视觉方向        用户确认      内容资产库
迭代修改        微修复静默      搜索验证         视觉质检                      19字段写入
               结构性失败路由
```

<details>
<summary><strong>🔍 各步骤详情</strong></summary>

| 步骤 | 做什么 | 关键约束 |
|------|--------|----------|
| **STEP 0** | 趋势调研：Reddit/X 捕捉全球情绪信号 → 小红书验证渗透度 → Pinterest 提取视觉方向 | 所有判断实时调研，不做静态推荐 |
| **STEP 1** | 解析用户输入的情绪主题词 | 提取核心情绪，识别复合情绪 |
| **STEP 2** | 情绪-媒介匹配判定 | 情绪分空间型/时间型；图文只擅长空间型；时间型情绪触发告警 |
| **STEP 3** | 隐喻挖掘：从身体经验出发，加载历史创作经验 | 强制加载 `workflow-memory.md` |
| **STEP 4** | 叙事角度卡片：四种角度（A/B/C/D）选择 | 用户确认后才进入写作 |
| **STEP 5** | 文案写作：展示初稿，对话式迭代 | 写作是对话，不是黑箱 |
| **STEP 6** | 文案质量校验：禁用词检查 + 结构检查 + 5 信号检查 | 微修复静默执行；结构性失败路由回用户 |
| **STEP 7** | 标签生成 + 小红书搜索验证 | 15 个标签分四层，零搜索量直接移除 |
| **STEP 8** | 视觉 Brief 生成 + 视觉质检 | 色彩决策每选题实时 Pinterest 调研，不用预设色板 |
| **STEP 9** | 存入飞书内容资产库（19 字段） | 自动建表，自动写入 |

</details>

### 按需加载机制

SKILL.md 硬上限 400 行。所有 reference 文件仅在对应 STEP 触发时加载：

| 时机 | 加载文件 |
|------|----------|
| STEP 1 启动 | `account-dna.md`（人设 + 禁用句式） |
| STEP 3 启动 | `workflow-memory.md`（创作经验便签，强制加载） |
| STEP 5 启动 | `writing-techniques.md` + `exemplars.md` |
| STEP 6 启动 | `quality-signals.md` |
| STEP 7 启动 | `search-strategy.md` |
| STEP 8 启动 | `visual-guide.md` |
| 用户可选 | `success-patterns.md` / `failure-patterns.md` |

<p align="right"><sub><a href="#top">↑ 回到顶部</a></sub></p>

---

## 🔬 质量门禁

| 门禁 | 工具/方式 | 检查内容 |
|------|----------|----------|
| 🔧 **媒介匹配** | STEP 2 判定 | 情绪分空间型/时间型；时间型情绪硬做图文先天残疾，触发告警 |
| 🚫 **禁用词检查** | `quality-signals.md` | 处方式句式、说教口吻、标签式表达 |
| 📐 **结构检查** | `quality-signals.md` | 钩子有效性、CTA 自然度、结尾结束感 |
| 📶 **5 信号检查** | `quality-signals.md` | 共鸣度、独特度、可行动度、传播度、搜索度 |
| 🏷️ **标签验证** | `search-strategy.md` | 小红书实时搜索验证，零搜索量直接移除，语义一致性校验 |
| 🎨 **视觉质检** | `visual-guide.md` | 图文一致性、主体占比 60%+、参照人物尺度 |

> **微修复静默执行，结构性失败路由回用户。** STEP 6 不是审美裁判——是格式诊断。每一条规则都需要为自己的存在辩护。

<p align="right"><sub><a href="#top">↑ 回到顶部</a></sub></p>

---

## 🛠️ 技术栈

<div align="center">

| 层级 | 技术 | 用途 |
|:---:|:---:|---|
| 🧠 | **Claude Code Skill** | 隐喻挖掘、场景写作、情绪视觉化 |
| 📋 | **飞书 Lark API** | 内容资产库 + 选题资产库（`lark-cli`） |
| 🌐 | **Reddit / X / Pinterest** | 趋势调研 + 视觉方向提取 |
| 📊 | **小红书搜索** | 标签验证 + 渗透度判断 |
| ✉️ | **Agently CLI** | 自动选题邮件汇总 |

</div>

<p align="right"><sub><a href="#top">↑ 回到顶部</a></sub></p>

---

## 📁 项目结构

```
inner-voice/
├── SKILL.md                          # 核心工作流（5 条流程，10 个 STEP，硬上限 400 行）
├── README.md                         # ← 你在看这里
├── CLAUDE.md                         # Git 工作流 + 飞书操作强制规则
├── LICENSE                           # MIT
│
├── conf/
│   └── schedule                      # 自动选题定时配置（HH:MM 格式）
│
├── assets/templates/                 # 输出模板
│   ├── metaphor-output.md            # STEP 3 隐喻候选输出（确认点 A-1）
│   ├── angle-card.md                 # STEP 4 叙事角度卡片（确认点 A-2，A/B/C/D 四种）
│   ├── recommendation-card.md        # STEP 0 选题推荐卡片
│   └── alert-time-emotion.md         # STEP 2 时间型情绪告警模板
│
├── scripts/
│   ├── feishu-upsert.sh              # 飞书内容资产库写入 + 自动建表（19 字段）
│   └── topic-upsert.sh               # 选题资产库写入 + 自动建表（16 字段）
│
└── references/                       # 领域知识库（按需加载）
    ├── account-dna.md                # 账号人设 + 禁用句式
    ├── auto-pipeline.md              # 流程 E 完整逻辑（定时 → 入库 → 邮件）
    ├── copywriting-mode.md           # 配文模式完整流程
    ├── exemplars.md                  # 中文语感参照库
    ├── failure-patterns.md           # 失败模式库
    ├── quality-signals.md            # 文案质量校验（3 校验 + 5 结构信号）
    ├── search-strategy.md            # 搜索优化 + 标签验证
    ├── success-patterns.md           # 爆款基因库
    ├── trend-matrix.md               # 趋势调研工具链
    ├── visual-guide.md               # 视觉 Brief 架构 + 质检
    ├── workflow-memory.md            # 创作经验便签（STEP 3 强制加载）
    └── writing-techniques.md         # 写作技法（钩子 / CTA / 修辞）
```

<p align="right"><sub><a href="#top">↑ 回到顶部</a></sub></p>

---

## 🔗 相关项目

| 仓库 | 做什么 |
|------|--------|
| [**healing-visual-lab**](https://github.com/shasha1108/healing-visual-lab) | 交互式数字疗愈作品集——15 件 Three.js / WebGL 交互实验 |
| [**healing-space**](https://github.com/shasha1108/healing-space) | 触觉驱动的交互式疗愈 H5 生成器——GPU 流体、WebGL 着色器 |
| [**pixel-bloom**](https://github.com/shasha1108/pixel-bloom) | 像素艺术 × 毛玻璃美学——赛博养宠、电子水族箱、像素盆栽 |
| [**h5-publish-skill**](https://github.com/shasha1108/h5-publish-skill) | 一键发布 H5 到 GitHub Pages——拖入文件夹即上线 |

<p align="right"><sub><a href="#top">↑ 回到顶部</a></sub></p>

---

## 🤝 参与贡献

1. 🍴 **Fork** 本仓库
2. 🌿 **创建分支**（`feature/你的想法`）
3. ✍️ **提交**清晰的 commit message
4. 📤 **Push** 并打开 **Pull Request**

**特别欢迎以下方向的贡献：**
- 新的隐喻挖掘角度和概念种子
- 写作技法补充（钩子、CTA、修辞）
- 小红书标签策略更新
- 趋势调研数据源扩展

> 本仓库使用的 Git 工作流规范见 [CLAUDE.md](CLAUDE.md)。

---

## 📄 许可

MIT © 2026 [@shasha1108](https://github.com/shasha1108) —— 详见 [LICENSE](LICENSE)。

<br>

<div align="center">

<sub>让每一个说不清的情绪，都有被准确命名的可能。 Giving every unnameable feeling a voice.</sub>

</div>

<p align="right"><sub><a href="#top">↑ 回到顶部</a></sub></p>
