# AW 品牌 · Cursor Skills（多技能 + 总调度）

本仓库提供 **ARCANE WARRIOR（AW）** 在 Cursor 里的一组 Agent Skills：**总调度 `aw-hub` + 四个子技能**，以及 **`AW_品牌共通基石.md`**（全技能先读）与 **`AW_品牌文案参考规则.md`**（第四章起执行层）。

## 仓库里有什么

| 路径 | 说明 |
|------|------|
| `AW_品牌共通基石.md` | **全技能先读**：品牌态度、产品理解、调性规范（理念 / 观点 / 态度）。 |
| `AW_品牌文案参考规则.md` | **第四章起执行层**：方法论、海报结构、类型 A～F、话术库、创始人洞察、dbs 协同等。 |
| `.cursor/skills/aw-hub/SKILL.md` | **总调度**：同事问「AW 能做什么」时的口语总览 + 任务路由表。 |
| `.cursor/skills/aw-topic-brief/SKILL.md` | **选题与文案方向**：海报、社交、上新活动、公众号等成稿。 |
| `.cursor/skills/aw-video-script/SKILL.md` | **短视频脚本**：分镜、口播、钩子（骨架；细则待 `AW_短视频脚本规范.md`）。 |
| `.cursor/skills/aw-listing-creative/SKILL.md` | **电商主图与详情**：主图文案、详情模块标题与卖点线（骨架；细则待 `AW_电商主图详情指引.md`）。 |
| `.cursor/skills/aw-product/SKILL.md` | **产品与参数**：规格、适配、SKU 口径（骨架；真源待 `AW_产品参数与SKU.md`）。 |

原单一入口 **`awaiskill`** 已拆为 **`aw-topic-brief`**（文案向）；不确定用哪个时，先 **`aw-hub`**。

克隆本仓库后，用 Cursor **打开该文件夹作为工作区**，`.cursor/skills/` 下全部 skill 即会加载。

## 同事怎么用

### 方式 A：项目级（推荐）

1. Clone 本仓库（或 submodule 到内容仓库）。  
2. 用 Cursor **打开含 `.cursor/skills/` 的仓库根目录**。  
3. 对话里可提：**AW**、**总调度**、**文案**、**脚本**、**详情**、**参数** 等；或说明「不知道从哪个开始」→ Agent 应优先参考 **`aw-hub`**。

### 方式 B：个人全局（推荐用脚本）

子技能在项目里用 **`../../../AW_品牌共通基石.md`** 与 **`../../../AW_品牌文案参考规则.md`**；拷到 `~/.cursor/skills/` 后由脚本改为同目录下的 **双软链** + Markdown 内相对链接。

在终端执行（路径按你本机 clone 位置改）：

```bash
bash "/Users/young/TRAE SOLO/scripts/install-global-aw-skills.sh"
```

脚本会：**删除全局 `awaiskill`**；把五个 `SKILL.md` 复制到 `~/.cursor/skills/<名>/`；在每个目录为 **`AW_品牌文案参考规则.md`** 与 **`AW_品牌共通基石.md`** 建立指向本仓库的软链；并把 Markdown 里的 `../../../…` 链接改成同目录文件名。

若仓库不在上述路径，可先：

```bash
export AW_SKILLS_REPO="/你的/aw-brand-ai-skill/绝对路径"
bash "$AW_SKILLS_REPO/scripts/install-global-aw-skills.sh"
```

更新 skill 逻辑后**再执行一次脚本**即可覆盖各 `SKILL.md`。

## 发布到 GitHub（维护者）

远程示例：`https://github.com/oriel9910/aw-brand-ai-skill.git`

```bash
git remote add origin https://github.com/oriel9910/aw-brand-ai-skill.git
git branch -M main
git push -u origin main
```

## 版本与更新

- 规则与更新日志见 `AW_品牌文案参考规则.md` 文首与「更新日志」。  
- 同事 **`git pull`** 同步；占位文档（`AW_短视频脚本规范.md` 等）补齐后同样提交到本仓库即可。

## 许可与保密

若含漫威联名等内部策略，建议仓库为 **Private**。
