
# 视觉 Brief 完整规则（STEP 8 参考文档）

> **目录：** 停滑五铁律 · Disturbing检查 · 速查卡 · 8.0 最高法则 · 8.1 策略矩阵 · 8.2 情绪本体优先 · 8.3 凝固不可能 · 8.4 风格调色板 · 8.4.5 MJ架构 · 8.5 3秒+美感 · 8.7 可执行性 · 8.8 输出规范 · 8.9 风格锚点 · 8.10 审美自检

## 🚨 封面停滑五铁律（任何视觉概念产生后 · 第一个检查点）

不通过任一条 = 概念不成立，返回重构思。

1. **一个东西，不是一片氛围** — 最大物理实体能用五个字说清？不能 → 不通过
2. **人物 ≤ 20%** — 人物是比例参照，"什么吞没了人"才是主角
3. **冷暖光引擎** — 至少一个集中暖光点，暗调图无暖光 = 信息流隐形
4. **封面不需文字解释** — 不看标题能感受到情绪？不能 → 是插图不是封面
5. **熟悉物体的异常状态** — 日常物体非常规状态制造"这是什么？"，不靠怪异靠悖论

```
□ 铁律1：最大物理实体是什么？（五个字说不清 → 重做）
□ 铁律2：人物占比多少？（>20% → 缩小人物）
□ 铁律3：暖光点在哪？（没有 → 加一个集中暖光源）
□ 铁律4：不看标题能感受到情绪吗？（不能 → 换视觉主体）
□ 铁律5：哪个熟悉物体被做了异常操作？（答不出 → 重做）
```
**五条全部通过 → 进入概念检查。**

> **组图铁律：每张图独立成立。** 任意单张发出去，没有其他图的观者也能感受到完整情绪。组图不是连续剧——是多角度同一种情绪。

---

## 🚨 概念层面 disturbing 检查（写 Prompt 前强制）

有些概念不是执行层出问题——是概念本身就不该被执行：

| 问题类型 | 示例 | 根因 |
|---------|------|------|
| **身体恐怖** | 人形上的空洞、胸腔缺失、身体内部透视 | 看到身体有洞的第一反应是不适 |
| **冷酷解构** | 人体被当作建筑/物品来描述 | 把人当物体=失去温度和共情 |
| **纪念碑式沉重** | 用于轻量/幽默/可爱型内容 | 热点温度与视觉重量不匹配 |

```
□ 给陌生人看，第一反应是"好美/有趣"还是"有点吓人"？
 → 后者 → 回到8.2重构思（信息层叠/可爱荒诞策略下改用8.1策略选择三问重新选策略），不得仅调整画风/色调
```

---

## ⚡ 速查卡（STEP 8首次执行前必须读全文；同一对话第二次及以后从此速查卡引用）

**🚨 封面停滑五铁律（第一个检查点 · 先于一切）：**
①一个东西不是氛围 ②人物≤20% ③冷暖光引擎 ④封面不需文字解释 ⑤熟悉物体的异常状态

**3维必须同时成立**：①美感=入场券（不是目标，是门槛）②情绪重量=差异化核心③概念钩子=停滑力来源
**🚨 配色第一性原则**：颜色存在的意义不仅仅是好看，更是为了让人感觉到什么。每种颜色在进入 Prompt 之前，必须能回答「这个颜色会让观者感觉到什么？」→ 答不出 = 颜色只是装饰，替换它。
**绝对禁用词**：ugly / chaotic / distorted figure / raw discomfort / disturbing / grotesque / harsh / creepy / nightmare

**5种视觉策略（平等 · 按情绪自然形态选择 · 无默认首选）**：
| 策略 | 最适合 | 特征 |
|------|--------|------|
| ONE MASSIVE | 情绪形态是单一巨大物理实体时 | 单一实体60%+，人物≤20%，冷暖对比 |
| 对比构图 | 情绪存在于两种状态同时为真时 | 上下/左右/内外两种状态并置 |
| 信息层叠 | 情绪需要机制可视化时 | 插画底层+半透明线条/图表叠加 |
| 可爱荒诞 | 情绪带有荒诞/自嘲/反差感时 | 最萌画风+最反鸡汤大实话 |
| 毛边插画 | 情绪质感是温暖/手作/生活感时 | 手绘笔触+analog颗粒感，仍是插画非摄影 |

**移除人物测试**：只看物理实体，能独立讲完情绪内部机制？否→氛围图→重构（信息层叠/对比构图可豁免）
**凝固不可能状态**：违反物理规律但情感上完全真实的单帧；用明确动词锁定（floating/frozen/suspended）
**AI可执行性铁律**：≤120词（v8.1理解力更强，可略长）；物理现象承载情感；情感词只在末尾
**标准参数**：`--ar 3:4 --raw --stylize 150-200 --v 8.1`（写实）/ `--stylize 500 --v 8.1`（超现实）
**情感张力法则**：找到THE ONE物理事实，让其他描述托举它；不直接说情绪，让物理差异渗出情感

> 需要完整凝固状态4种分类、风格调色板9种、自检清单、进阶参数 → 继续读全文

---

> **使用方法：** 在 STEP 8 写第一个 MJ Prompt 之前，完整阅读本文件。
> 执行顺序：封面停滑五铁律 → Disturbing检查 → 8.0 最高法则 → 8.1 视觉策略 → 8.2 情绪本体检验 → 8.3 凝固不可能状态 → 8.4 风格选择 → 8.4.5 Prompt架构 → 写 Prompt → 8.5 3秒+美感 → 8.7 可执行性 → 8.8 输出规范 → 8.9 风格锚点 → 8.10 审美自检

---

## 8.0 视觉最高法则：美 × 情绪重量 × 概念钩子（三者必须同时成立）

| 维度 | 角色 | 缺失症状 |
|------|------|---------|
| ① 美感 | **入场券** | 构图粗糙、色调脏 → 比普通图更快被划走 |
| ② 情绪重量 | **差异化核心** | 只是"漂亮的孤独场景" → 无收藏价值 |
| ③ 概念钩子 | **停滑力来源** | 没有视觉悖论或凝固瞬间 → 信息流淹没 |

### 概念辨识度 > 执行完成度

一个视觉概念如果可被概括为"又一张X调的图"——替换它。

```
□ 0.5秒内用户看到的是"又一张X"还是"一个具体的、不可预期的东西"？
 → "又一张X" → 回到 8.2 重构思（信息层叠/可爱荒诞策略下改用8.1重选策略）
```

### 配色第一性原则

颜色存在的意义是让人感觉到什么。写每个 Prompt 前：
```
□ 主色调让观者进入什么情绪？
□ 冷暖对比制造了什么情绪张力？
```
> 配色参考来自 STEP 0 对 Pinterest 当前热门同类作品的实时调研结果。

**视觉总纲**：「精致优雅的画面承载锋利精准的情绪洞察」——视觉如同一首工整的诗，但内容刺骨。

**视觉标识铁律**：全账号保持"情绪插画"视觉信号，不混入真实摄影图。需要"真实感"时，通过插画语言实现——手绘笔触、不完美边缘、analog颗粒感质感，底层仍是数字插画/绘画。

---

## 8.1 视觉策略矩阵（升级 · 替代单一公式）

**视觉策略第一性原理：情绪匹配优先于策略归属。五种策略完全平等，无默认首选。不问"这篇用哪种策略"——先问"这个情绪在视觉上的自然形态是什么？"答案决定策略。**

根据情绪的视觉自然形态选择策略：

| 策略 | 情绪自然形态（适用条件） | 核心特征 | 示例 | 视觉主体性测试 |
|------|----------------------|---------|------|--------------|
| **ONE MASSIVE** | 情绪形态是单一巨大物理实体时 | 单一巨大物理实体（占60%+）+ 人物极小（≤20%）+ 冷暖色对比 | 漩涡、玻璃盒、巨石、迷宫 | 必须通过 |
| **对比构图** | 情绪存在于两种状态同时为真时 | 画面分割为两种状态并置（左右/上下/内外），视觉冲突制造张力 | 白天精力充沛vs深夜崩溃；表面平静vs内在风暴 | 豁免 |
| **信息层叠** | 情绪需要"为什么会这样"的机制可视化时 | 插画底层 + 半透明文字/图表/线条叠加，视觉化"为什么会这样" | 情绪身体地图、神经系统画报 | 豁免 |
| **可爱荒诞** | 情绪带有荒诞/自嘲/反差感时 | 最萌画风 + 最反鸡汤大实话，可爱IP形象+荒诞场景 | 圆滚滚小人对着深渊微笑 | 豁免 |
| **毛边插画** | 情绪质感是温暖/手作/生活感时 | 手绘笔触、不完美边缘、analog颗粒感、撕纸纹理——**仍然是插画，不是摄影** | 手账风格情绪日记、带温度的素描感 | 豁免 |

**策略选择三问：**
1. 这个情绪的自然视觉形态是什么？（单一巨大实体→ONE MASSIVE / 两种状态并置→对比构图 / 机制解释→信息层叠 / 荒诞自嘲→可爱荒诞 / 生活质感→毛边插画）
2. 在信息流里，哪种策略最有停滑力？
3. 最近5篇内容用了什么策略？需要换一种避免视觉疲劳吗？

**A/B测试模式**：用户要求时，同一文案生成两种不同策略的Prompt，标记A/B版本，分时间段发布对比。

---

## 8.2 情绪本体优先：不画情绪的"环境"，画情绪本身发生的内部机制

> **适用策略**：ONE MASSIVE、对比构图。信息层叠和可爱荒诞策略可豁免此检验。

情绪不是一个场景的背景板。情绪是发生在「你和你自己之间」的一件事。

| 情绪 | ✗ 美但空（画环境） | ✓ 美且有重量（画机制） |
|------|------------------|---------------------|
| 孤独 | 剪影坐在窗边看城市灯火 | 被困在透明玻璃盒里，盒外世界触不到 |
| 焦虑 | 雨中没有伞的人 | 所有雨滴凝固在空中，她身边一片清空 |
| 倦怠 | 工位前疲惫的剪影 | 所有人虚化成长曝光光轨，只有她是凝固静止的 |

**机制图检验（移除人物测试）**：把画面里的人物移除，剩下的部分还能"独立讲完这个情绪的内部发生"吗？
→ 能 → 机制图，继续
→ 不能 → 氛围图，重新构思

**视觉和文案必须用同一个隐喻。** STEP 8第一个问题：`confirmed_metaphor` 在画面里长什么样子？

---

## 8.3 凝固不可能状态（ONE MASSIVE策略必用 · 其他策略可选）

```
凝固不可能状态 = 违反物理规律但情感上完全真实的单帧视觉状态

四种选型：

▸ 空间悖论型 ✅ 全部可用
 — 玻璃穹顶内外颠倒 / 室内存在室外天气 / 漂浮在空中的建筑或城市

▸ 尺度错位型 ✅ 全部可用
 — 极小人物 + 情绪物化的巨大存在

▸ 存在悖论型（⚠️ 部分子项已废）
 ✅ 人无影子
 ✅ 半透明中空身体
 🚫 影子已分离/有自主姿态（已验证失败）

▸ 决定性顶点型（⚠️ 部分子项已废）
 ✅ 水面恰在眼睛高度
 ✅ 裂缝从人向外辐射
 🚫 硬币悬停最高点 / 手指距按钮5毫米（观者难识别）
```

**凝固不可能状态自检：**
- □ 是凝固状态，不是过程或持续动作？
- □ 全部纯视觉可描述？
- □ 内置视觉矛盾（光/暗 · 内/外 · 有/无 · 巨/小）？
- □ 不属于 🚫 红线子项？
- □ 陌生人看到这张图，会产生「这是什么」的停滑冲动？

---

## 8.4 视觉风格调色板

> **唯一硬约束：单 Prompt 内部风格词必须自洽。**

| 风格方向 | 适合情绪范围 | 协调词组 | 参数建议 |
|---------|------------|---------|---------|
| **油画** | 重量/张力：撕裂、幻灭、崩溃 | `oil painting, painterly brushstrokes, dramatic chiaroscuro, rich pigment texture` | `--s 250 --ar 3:4 --v 8.1` |
| **水彩插画** | 柔软/克制：孤独、失望、渴望自由 | `watercolor illustration, muted palette, soft wash edges, ample negative space` | `--ar 3:4 --v 8.1` |
| **电影写实** | 真实/沉浸：焦虑、失控、倦怠 | `cinematic photography, natural ambient lighting, film grain, kodak portra tones` | `--style raw --ar 3:4 --v 8.1` |
| **极简插画** | 冷静/克制：冷漠、疏离、迷失 | `minimalist illustration, flat tonal blocks, geometric composition, large negative space` | `--ar 3:4 --v 8.1` |
| **超现实艺术** | 悖论/梦境：内耗、撕裂、迷失 | `surrealist art, Magritte-inspired dreamlike composition, conceptual juxtaposition` | `--s 300 --ar 3:4 --v 8.1` |
| **水墨/版画** | 古典/锋利：崩溃、幻灭 | `black and white ink illustration, sumi-e brushwork, high contrast` | `--ar 3:4 --v 8.1` |
| **数字蒙太奇** | 当代/异化：疏离、内耗、数字倦怠 | `digital collage, mixed media, contemporary surrealism, layered textures` | `--s 250 --ar 3:4 --v 8.1` |
| **复古胶片插画** | 怀旧/真实感（插画语言） | `vintage illustration, faded analog tones, warm tint, visible grain texture, hand-drawn quality` | `--ar 3:4 --v 8.1` |
| **手绘毛边** | 生活感/附近：重返附近、日常 | `rough sketch illustration, imperfect lines, torn paper texture, analog warmth, handwritten feel` | `--ar 3:4 --v 8.1` |

**风格选择决策三问：**
1. 情绪本质适合什么"质感"？
2. 概念钩子在哪种风格下最有效？
3. 这次想区别于过往作品吗？

**4张图组内风格规约：** 同一组4张图风格方向必须统一。

---

## 8.4.5 MJ v8.1 Prompt 架构规范（写第一个Prompt前必读）

> **版本说明**：本节基于 MJ v8.1 实测提示词总结，替代旧版 v6.1 规则。v8.1 的语义理解能力显著提升，部分旧规则（如禁止情感氛围词）已不适用。
> ⚠️ MJ 版本号以实际使用时最新稳定版为准。当前基准：v8.1。

### v8.1 Prompt 七层架构（按顺序排列）

```
① 镜头位置（绝对化必须）
 → "Absolute top-down bird's-eye view" / "extreme close-up" / "wide establishing shot"
 → 禁止模糊表达：❌ "bird's eye view-ish" / "from above"

② 世界场景（物理现象，不是情绪描述）
 → 描述画面里"有什么"以及它们的物理状态
 → ❌ 不说情绪："loneliness fills the space"
 → ✅ 说物理："a dense flowing river of cold silver-white human light trails streaming uniformly"

③ 单一人物的三个物理事实
 → 尺寸 + 位置 + 姿态/朝向（用物理精度，不用情感词）
 → ✅ "a single small faceless human silhouette stands perfectly still at the center, facing the exact opposite direction"

④ 人物的唯一性（情感张力通过物理差异表达）
 → 让情感从物理差异里渗出来，不直接说情感
 → ✅ "emits a faint but unwavering warm burnt amber glow that belongs only to them"
 → ❌ "feels lonely and different from the crowd"

⑤ 构图指令（可选）
 → "90% negative space" / "centered composition" / "rule of thirds"

⑥ 介质质感 + 具体颜料名颜色
 → 介质：`textured oil pastel and thick impasto brushstrokes` / `conceptual photography style`
 → 颜色用颜料名：`Prussian blue` / `cadmium yellow` / `burnt amber` / `silver-white`
 → ❌ 不用通用描述：`cold blue` / `warm yellow`

⑦ 情感氛围词 + 品质词（末尾，v8.1允许）
 → `ethereal lighting` / `poetic and touching` / `dreamlike quality` / `mysterious atmosphere`
 → `masterpiece` / `8k resolution`（可选，帮助品质下限）
```

### 参数标准（v8.1）

```
写实插画/故事书风格：--ar 3:4 --raw --stylize 150 --v 8.1
超现实/概念风格： --ar 3:4 --stylize 500 --v 8.1
标准情绪插画： --ar 3:4 --raw --stylize 200 --v 8.1

--raw → 减少MJ自动美化，保留更多原始质感（插画首选）
--stylize 150-250 → 接近自然；500 → 更风格化
```

### 仍然禁止的词（v8.1依然失效）

| 禁止 | 原因 | 替代 |
|------|------|------|
| `vs` / `contrasting with` | 抽象对比，MJ无法渲染 | 直接描述两者并列的物理状态 |
| `made visible` / `suggesting` / `conveying` | 指令性，不是描述 | 删除，直接描述物体 |
| `sense of` / `feeling of` | 情感感受词（位置错误，放到第⑦层才允许） | 在⑦层用具体词替代 |
| 歧义词 `skeleton` / `dark` / `industry` | MJ按最常见义渲染 | `bare branches` / `deep navy` / `activity` |

### 情感张力的物理化写法（核心技巧）

不要说情感，用物理现象承载它：

```
❌ "the loneliness of standing apart from everyone"
✅ "a quiet collision of temperature at the point where their body meets the cold silver current"

❌ "she feels trapped and unable to escape" 
✅ "the mirror reflecting infinite maze corridors and multiple reflections of themselves creating a recursive loop effect"

❌ "exhausted, unable to move forward"
✅ "stands perfectly still at the center of the frame facing the exact opposite direction"
```

**法则**：找到THE ONE物理事实，它本身就包含全部情感。其他描述都在托举它。

---

## 8.5 3秒识别硬约束 + 美感校验

**🚫 禁止使用的视觉差异类型：**
- ❌ 影子的微小偏移、倒影微小差异、表情细微变化
- ❌ 任何"差几度/几像素"的精确差异
- ❌ 任何需要"对比两处才能发现"的差异

**✅ 鼓励使用的：**
- ✅ 完整悖论物体（巨大漩涡、透明盒、巨大压顶物）
- ✅ 极端尺度对比
- ✅ 颜色/明暗强对比块
- ✅ 明显"不该在那里"的元素
- ✅ 清晰的物理形状破坏
- ✅ 数量的堆叠

**3秒陌生人识别测试 + 美感校验：**
```
□ 3秒内能说出核心情绪/概念？
□ 需要仔细看才能发现哪里不对？→ 不通过
□ 第一眼看到的是"一个人+一片地+氛围"？→ 不通过
□ 立刻有"这是XX的感觉"的反应？
□ 美感：想象成手机壁纸，会不会因为太丑/太怪而被取下？
□ 0.5秒停滑：第一眼是「好美」还是「好美，等一下，哪里不对？」
```

---

## 8.7 AI可执行性五问 + 可实现度

- □ **词数 ≤ 120**？超过则压缩（v8.1 理解力更强，可略长至 150 词）
- □ **每个词都"可视觉化"**？删除抽象概念词、叙事陈述、元描述
- □ **不可能状态用明确动词锁定**？如 `floating mid-air, frozen` / `suspended motionless`
- □ **单Prompt内部风格自洽**？常见冲突：watercolor+film grain / oil painting+photorealistic
- □ **核心视觉元素 ≤ 5-7个**？

| 可实现难度 | 示例 | 策略 |
|-----------|------|------|
| **低** | 物体悬停、光停在边缘、巨大尺度对比 | 直接Prompt，1-3次抽卡 |
| **中** | 雨滴凝固、水面碎裂、室内外部天气 | 精确动词 + 5-10次抽卡 |
| **高** | 影子自主姿态、镜中倒影背对 | 降级/换隐喻/后期合成 |

---

## 8.8 图文模式输出规范

**张数由文案决定，不强制 4 张。** 封面（首图）是决定性的——封面没过封面停滑五铁律，后面的图没有意义。优先确保封面概念成立，再根据文案需要决定是否需要补充视角。

**输出优先级：** ① 封面（必须，情绪张力最强的一张）→ ② 可选补充视角（当文案存在不同层面的情绪需要不同画面表达时）

**输出前必检：** 封面是否通过了封面停滑五铁律 + disturbing检查 + 审美底线自检？不通过 → 不输出。

```
每张输出格式：
—— 图 X：[情绪切面描述]（封面标注"★ 封面"）——
创作意图：（一句话）
视觉策略：[ONE MASSIVE / 对比构图 / 信息层叠 / 可爱荒诞 / 毛边插画]
MJ Prompt：[完整英文Prompt + 参数]
```

---

## 8.9 风格锚点库（已验证通过的风格组合 · 写Prompt时从此库选择而非凭空创造）

> 每个Prompt必须选择其中一个锚点风格作为基础，然后根据具体情绪微调。禁止不选锚点直接"自由创作"。

| 锚点 | 已验证场景 | 核心Prompt词组 | 参数 |
|------|----------|---------------|------|
| **深蓝情绪** | 孤独/失落/被吞没 | `deep navy atmospheric illustration, single massive physical entity, painterly brushstrokes, cyan-white warm pinpoint light source, 90% negative space above` | `--ar 3:4 --raw --s 200 --v 8.1` |
| **暖橘重压** | 倦怠/焦虑/窒息 | `warm burnt amber and deep burnt umber palette, thick impasto texture, heavy atmosphere, single small figure, vast oppressive space` | `--ar 3:4 --raw --s 180 --v 8.1` |
| **冷冽留白** | 疏离/冷漠/空 | `cold silver-white and pale blue grey, minimalist composition, sharp clean edges, vast empty space, isolated geometric form` | `--ar 3:4 --s 150 --v 8.1` |
| **水墨悖论** | 撕裂/矛盾/对峙 | `sumi-e ink wash illustration, high contrast black and white, dramatic negative space, wet-into-dry brushwork, single impossible object` | `--ar 3:4 --s 250 --v 8.1` |
| **暖光破暗** | 渴望自由/微小希望 | `deep charcoal darkness with single warm cadmium yellow light source breaking through, chiaroscuro, atmosphere thick with floating dust particles in light beam` | `--ar 3:4 --raw --s 200 --v 8.1` |

**使用规则**：选择一个锚点 → 将本笔记的具体隐喻/不可能状态替换锚点中的"generic主体" → 保持锚点的色调/介质/氛围词组不变。

---

## 8.10 审美底线自检（Prompt 最终确定前）

```
【审美底线自检 · 图X/4】

1. 停滑力：手机第一眼，具体哪个物理元素让人停下来？
2. AI感：哪里可能"像AI画的"？如何避免？
3. 颜色情绪：颜色让观者感觉到什么？
```
