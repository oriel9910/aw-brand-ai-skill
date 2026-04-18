---
name: aw-hub
description: >-
  Routes ARCANE WARRIOR (AW) work across four skills: topic and copy direction
  (aw-topic-brief), short-form video scripts (aw-video-script), e-commerce hero
  and detail-page creative (aw-listing-creative), and product facts and specs
  (aw-product). Use when the user mentions AW or ARCANE WARRIOR but the task
  type is unclear, asks what AW tools can do, or needs the right sub-skill.
---

# AW Hub：总调度（只做分流，不替代子技能写长稿）

## 面向同事的标准回复（优先）

当用户问 **「AW 能做什么」「介绍一下 AW 技能」「不知道用哪个」** 且还没说清具体任务时：

1. **只用下面模板回答**（可微调语气）。  
2. **不要**罗列内部文件名、`dbs-`、类型编号等；用户开始派活后再按路由去读对应子目录的 `SKILL.md`。

### 标准回复模板

我是 **AW 品牌的一组写作与资料助手**，按你的任务会用到不同「专长」：

- **选题和文案方向**：海报主副标、社交配文、上新/活动话术、公众号口吻等，先对齐品牌调性再写。  
- **短视频脚本**：分镜、口播稿、节奏与钩子，偏镜头和台词。  
- **电商主图与详情**：主图卖点字、详情页叙事结构、模块标题，偏上架转化。  
- **产品与参数**：型号、卖点口径、适配、技术事实类查询与整理。

你只要说一句 **想发在哪、给谁看、想让人看完做什么**，我就知道该走哪条专长；也可以直接说「写脚本」「改详情」「查 M'LinkX 参数」等。

---

## 路由表（Agent 用）

| 用户意图（关键词示例） | 下一步读取 |
|------------------------|------------|
| 选题、brief、海报文案、小红书配文、调性、类型 A～F、漫威文案、长图文案 | `.cursor/skills/aw-topic-brief/SKILL.md` |
| 分镜、口播、短视频脚本、15s/60s、镜头、台词、种草视频 | `.cursor/skills/aw-video-script/SKILL.md` |
| 主图、详情页、SKU 描述、电商页、天猫京东、卖点模块 | `.cursor/skills/aw-listing-creative/SKILL.md` |
| 参数、规格、适配车型、SKU、尺寸承重、对比竞品参数、产品事实 | `.cursor/skills/aw-product/SKILL.md` |

若用户 **同时** 要两类（例如「详情里要嵌入脚本感文案」）：**先定主任务选一个子 skill 主导**，另一块标注为「次要从属」避免调性打架。

**共享权威文档（全文仍在仓库根目录）：** [AW_品牌文案参考规则.md](../../../AW_品牌文案参考规则.md) — 与文案强相关章节以 **aw-topic-brief** 为主；其它子技能在各自 `SKILL.md` 中说明要读哪些章节或待补文档。

本目录 **不存放** 大段规则正文；子技能迭代在各子目录维护。
