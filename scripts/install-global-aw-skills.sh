#!/usr/bin/env bash
# 将 AW 多技能安装到 ~/.cursor/skills/，并删除已废弃的全局 awaiskill。
# 用法：在终端执行
#   bash "/Users/young/TRAE SOLO/scripts/install-global-aw-skills.sh"
# 若仓库不在默认路径，可先 export AW_SKILLS_REPO="/你的/仓库/绝对路径"

set -euo pipefail

REPO="${AW_SKILLS_REPO:-$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)}"
RULES="$REPO/AW_品牌文案参考规则.md"

if [[ ! -f "$RULES" ]]; then
  echo "未找到规则文件: $RULES" >&2
  exit 1
fi

rm -rf "${HOME}/.cursor/skills/awaiskill"
echo "已删除全局 awaiskill（若存在）。"

for d in aw-hub aw-topic-brief aw-video-script aw-listing-creative aw-product; do
  mkdir -p "${HOME}/.cursor/skills/${d}"
  cp "${REPO}/.cursor/skills/${d}/SKILL.md" "${HOME}/.cursor/skills/${d}/SKILL.md"
  ln -sf "$RULES" "${HOME}/.cursor/skills/${d}/AW_品牌文案参考规则.md"
  # 全局目录下用同目录软链的规则文件，替换仓库内的 ../../../ 链接
  if sed --version >/dev/null 2>&1; then
    sed -i 's|](\.\./\.\./\.\./AW_品牌文案参考规则.md)|](AW_品牌文案参考规则.md)|g' "${HOME}/.cursor/skills/${d}/SKILL.md"
  else
    sed -i '' 's|](\.\./\.\./\.\./AW_品牌文案参考规则.md)|](AW_品牌文案参考规则.md)|g' "${HOME}/.cursor/skills/${d}/SKILL.md"
  fi
  echo "已安装: ~/.cursor/skills/${d}/"
done

echo "完成。请重启或新开 Cursor 窗口以便加载 skills。"
