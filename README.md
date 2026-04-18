# AW 品牌文案 · Cursor Skill（awaiskill）

本仓库提供 **ARCANE WARRIOR（AW）** 在 Cursor 里的品牌文案 Agent Skill，以及人类可读的完整规则文档，便于团队统一调性与协作方式。

## 仓库里有什么


| 路径                                  | 说明                                                 |
| ----------------------------------- | -------------------------------------------------- |
| `AW_品牌文案参考规则.md`                    | 品牌文案**唯一权威规则**（含类型 A～F、漫威、创始人红线、与可选 dbs 协同等）。      |
| `.cursor/skills/awaiskill/SKILL.md` | Cursor **Skill 入口**：同事问「你能做什么」时的口语介绍 + Agent 执行说明。 |


克隆本仓库后，用 Cursor **打开该文件夹作为工作区**，即可在本项目中自动加载 `awaiskill`。

## 同事怎么用（两种方式）

### 方式 A：只做项目级（推荐团队仓库）

1. 把本仓库 **clone** 或 **submodule** 进你们的品牌/内容仓库。
2. 保证工作区根目录下存在：
  - `AW_品牌文案参考规则.md`  
  - `.cursor/skills/awaiskill/SKILL.md`
3. 用 Cursor 打开该工作区，在 Agent 里提 **AW / 品牌文案 / `/awaiskill`** 等即可。

### 方式 B：个人全局（任意文件夹都能用）

在本机终端执行（把 `路径` 换成你 clone 后的**绝对路径**）：

```bash
mkdir -p ~/.cursor/skills/awaiskill
ln -sf "路径/AW_品牌文案参考规则.md" ~/.cursor/skills/awaiskill/AW_品牌文案参考规则.md
cp "路径/.cursor/skills/awaiskill/SKILL.md" ~/.cursor/skills/awaiskill/SKILL.md
```

之后规则文件仍指向你 clone 的位置，**改仓库、拉代码即更新**；若 `SKILL.md` 有更新，再执行一次最后一行的 `cp` 覆盖即可。

> macOS / Linux 适用。Windows 可用「复制 `SKILL.md` + 复制规则文件到同目录」代替软链。

## 发布到 GitHub（维护者）

1. 在 GitHub 上 **New repository**（例如 `aw-brand-cursor-skill`，可见范围按公司要求选 Private/Public）。
2. 本地已 `git init` 并含首次提交时，绑定远程并推送：

本仓库已绑定的远程（维护者核对用）：

`https://github.com/oriel9910/aw-brand-ai-skill.git`

首次推送：

```bash
cd /path/to/this-repo
git remote add origin https://github.com/oriel9910/aw-brand-ai-skill.git
git branch -M main
git push -u origin main
```

若已安装 [GitHub CLI](https://cli.github.com/)，也可在空目录用 `gh repo create` 建库；本仓库已存在远程时只需 `git push -u origin main`。

## 版本与更新

- 规则文档文首有 **版本号**；更新日志见 `AW_品牌文案参考规则.md` 内「更新日志」章节。  
- 同事侧：`**git pull`** 即可同步；使用方式 B 的，拉代码后规则通过软链已更新，`SKILL.md` 若有变更再 `cp` 一次。

## 许可与保密

若含漫威联名等内部策略，建议仓库为 **Private**，仅邀请组织成员访问。