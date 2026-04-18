# AW 品牌 · Cursor Skills（多技能 + 总调度）

本仓库提供 **ARCANE WARRIOR（AW）** 在 Cursor 里的一组 Agent Skills：**总调度 `aw-hub` + 四个子技能**，以及人类可读的 **`AW_品牌文案参考规则.md`**。

## 仓库里有什么

| 路径 | 说明 |
|------|------|
| `AW_品牌文案参考规则.md` | 品牌**核心规则**（调性、类型 A～F、漫威、创始人红线、dbs 可选协同等）。 |
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

### 方式 B：个人全局（多 skill 时注意路径）

子技能里的 `SKILL.md` 使用相对路径 **`../../../AW_品牌文案参考规则.md`**（相对于 **仓库根**）。若把整个 `.cursor/skills/` 拷到 `~/.cursor/skills/`，该相对路径会**失效**。

因此 **多技能场景优先用方式 A**；若必须全局，请：

- 将本仓库 clone 到**固定绝对路径**，并把下面脚本里的 `REPO` 改成该路径后执行（为每个子目录放入规则软链，便于单文件引用；**`SKILL.md` 仍以仓库内为真源**，用 `cp` 同步更新）：

```bash
REPO="$HOME/path/to/aw-brand-ai-skill"
for d in aw-hub aw-topic-brief aw-video-script aw-listing-creative aw-product; do
  mkdir -p "$HOME/.cursor/skills/$d"
  ln -sf "$REPO/AW_品牌文案参考规则.md" "$HOME/.cursor/skills/$d/AW_品牌文案参考规则.md"
  cp "$REPO/.cursor/skills/$d/SKILL.md" "$HOME/.cursor/skills/$d/SKILL.md"
done
```

（若你希望全局 `SKILL.md` 内链改为 `./AW_品牌文案参考规则.md`，可在拷贝后批量替换；需要时我可以再出一版「仅全局用」的 SKILL 变体。）

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
