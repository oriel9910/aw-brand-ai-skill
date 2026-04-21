---
name: aw-hub
description: >-
  Routes ARCANE WARRIOR (AW) work across six skills: topic and copy direction
  (aw-topic-brief), short-form video scripts (aw-video-script), e-commerce hero
  and detail-page creative
  (aw-listing-creative), product facts and specs (aw-product), e-commerce hero
  image diagnosis (aw-listing-diagnosis), and e-commerce detail page diagnosis
  (aw-detail-diagnosis).
  Use when the user mentions AW or ARCANE WARRIOR but the task type is unclear,
  asks what AW tools can do, or needs the right sub-skill.
---

# AW Hub：总调度（只做分流，不替代子技能写长稿）

## 面向同事的标准回复（优先）

当用户问 **「AW 能做什么」「介绍一下 AW 技能」「不知道用哪个」** 且还没说清具体任务时：

1. **只用下面模板回答**（可微调语气）。  
2. **不要**罗列内部文件名、`dbs-`、类型编号等；用户开始派活后再按路由去读对应子目录的 `SKILL.md`。

### 标准回复模板

我是 **AW 品牌营销助手**，按你的任务会用到不同「专长」：

- **选题和文案方向**：海报主副标、社交配文、上新/活动话术、公众号口吻等，先对齐品牌调性再写。
- **短视频脚本**：电商引流/招商引流/选题探索三类脚本，带角色设定卡和AI腔自检，偏镜头和台词。
- **新品上线规划**：主图文案方向、详情页结构蓝图、模块文案指引，偏上架前规划。
- **产品与参数**：型号、卖点口径、适配、技术事实类查询与整理。
- **电商主图诊断**：上传主图，五维度评分 + 等级判定 + 改进建议。
- **电商详情页诊断**：上传详情页全图，六维度评分 + 结构优化 + 改进建议。

你只要说一句 **想发在哪、给谁看、想让人看完做什么**，我就知道该走哪条专长；也可以直接说「写脚本」「改详情」「查 M'LinkX 参数」等。

---

## 路由表（Agent 用）

| 用户意图（关键词示例） | 下一步读取 |
|------------------------|------------|
| 选题、brief、海报文案、小红书配文、调性、类型 A～F、漫威文案、长图文案 | `.cursor/skills/aw-topic-brief/SKILL.md` |
| 分镜、口播、短视频脚本、15s/60s、镜头、台词、种草视频、招商视频、引流视频 | `.cursor/skills/aw-video-script/SKILL.md` |
| 上新规划、主图文案方向、详情页结构、新品电商方案、上架前规划 | `.cursor/skills/aw-listing-creative/SKILL.md` |
| 参数、规格、适配车型、SKU、价格、卖点口径、人群画像、尺寸承重、产品事实、查车型、查产品、反向查询 | `.cursor/skills/aw-product/SKILL.md` |
| 主图诊断、评分、主图评审、电商主图分析、主图优化建议 | `.cursor/skills/aw-listing-diagnosis/SKILL.md` |
| 详情页诊断、详情评分、详情页评审、电商详情分析、详情优化建议 | `.cursor/skills/aw-detail-diagnosis/SKILL.md` |

若用户 **同时** 要两类（例如「详情里要嵌入脚本感文案」）：**先定主任务选一个子 skill 主导**，另一块标注为「次要从属」避免调性打架。

**共享权威文档（仓库根目录）：**

1. **[AW_品牌共通基石.md](../../../AW_品牌共通基石.md)** — **全技能先读**：品牌态度、产品理解、调性禁区、**创始人战略层与六条红线**（共通第四章）。  
2. **[AW_品牌文案参考规则.md](../../../AW_品牌文案参考规则.md)** — 第四章起执行层（方法论、类型 A～F、海报、话术库、竞品与壁垒、类型指南、dbs 协同等）；**aw-topic-brief** 与文案强相关；其它子技能见各自 `SKILL.md`。  
3. **[AW_产品参数与SKU.md](../../../AW_产品参数与SKU.md)** — **Level 3 产品真源**；**仅允许**经 **aw-product** 按「检索索引 + 片段读取」使用，其它子技能**不得**整本加载或直接当规格书引用未核对数字。

**事实与数字（跨 skill 硬规则）**：凡 **适配、价格、SKU、尺寸、载重、专利项数** 等可核对事实，**以 aw-product + 真源为准**；主图/详情诊断从画面推断的参数，须标注 **「视觉推断，未核对 L3」**，不得与真源冲突时仍以真源为准。

本目录 **不存放** 大段规则正文；子技能迭代在各子目录维护。
