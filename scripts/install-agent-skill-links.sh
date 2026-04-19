#!/usr/bin/env bash
# 读取仓库根目录 agent-skill-map.json，把本仓库的 skills + 映射内文档用软链安装到
# Cursor / Hermes / OpenClaw / ~/.agents 等目录；各 skill 的 SKILL.md 复制到目标并改写内链。
#
# 用法：
#   bash scripts/install-agent-skill-links.sh --targets cursor,hermes,openclaw,agents
#   bash scripts/install-agent-skill-links.sh --all
#   bash scripts/install-agent-skill-links.sh --dry-run
#
# 可选环境变量：
#   AW_SKILLS_REPO   仓库绝对路径（默认：脚本所在仓库根）
#   仍兼容旧脚本：仅装 Cursor 全局可用 install-global-aw-skills.sh

set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
REPO="${AW_SKILLS_REPO:-$(cd "$SCRIPT_DIR/.." && pwd)}"
MAP="$REPO/agent-skill-map.json"

DRY_RUN=0
TARGETS=""

usage() {
  cat <<'EOF'
用法:
  bash scripts/install-agent-skill-links.sh --targets cursor,openclaw
  bash scripts/install-agent-skill-links.sh --all
  bash scripts/install-agent-skill-links.sh --dry-run

--targets   逗号分隔：cursor | hermes | openclaw | agents
--all       等同于 cursor,hermes,openclaw,agents
--dry-run   只打印将执行的命令，不写盘
EOF
}

while [[ $# -gt 0 ]]; do
  case "$1" in
    --targets) TARGETS="${2:-}"; shift 2 ;;
    --all) TARGETS="cursor,hermes,openclaw,agents"; shift ;;
    --dry-run) DRY_RUN=1; shift ;;
    -h|--help) usage; exit 0 ;;
    *) echo "未知参数: $1" >&2; usage; exit 2 ;;
  esac
done

if [[ -z "$TARGETS" ]]; then
  echo "请指定 --targets 或 --all" >&2
  usage
  exit 2
fi

if [[ ! -f "$MAP" ]]; then
  echo "未找到映射文件: $MAP" >&2
  exit 1
fi

if ! command -v python3 >/dev/null 2>&1; then
  echo "需要 python3 用于读取 agent-skill-map.json" >&2
  exit 1
fi

# 删除已废弃的全局 awaiskill（若存在）
if [[ "$DRY_RUN" -eq 1 ]]; then
  echo "[dry-run] rm -rf ${HOME}/.cursor/skills/awaiskill"
else
  rm -rf "${HOME}/.cursor/skills/awaiskill" 2>/dev/null || true
fi

python3 - "$REPO" "$MAP" "$TARGETS" "$DRY_RUN" <<'PY'
import json, os, pathlib, subprocess, sys

repo = pathlib.Path(sys.argv[1]).resolve()
map_path = pathlib.Path(sys.argv[2])
targets_arg = sys.argv[3]
dry = int(sys.argv[4])

def expand(p: str) -> pathlib.Path:
    p = os.path.expanduser(p)
    return pathlib.Path(p)

data = json.loads(map_path.read_text(encoding="utf-8"))
skills = data["skills"]
docs = data["documents"]
targets_cfg = data["targets"]
custom = data.get("custom_targets") or []

selected = {t.strip() for t in targets_arg.split(",") if t.strip()}
valid = {"cursor", "hermes", "openclaw", "agents"}
unknown = selected - valid
if unknown:
    print("未知 target:", ", ".join(sorted(unknown)), file=sys.stderr)
    sys.exit(2)

def run(cmd: list[str]):
    if dry:
        print("[dry-run]", " ".join(cmd))
    else:
        subprocess.run(cmd, check=True)

def link_doc(src: pathlib.Path, dst: pathlib.Path):
    if not src.exists():
        raise SystemExit(f"源文件不存在: {src}")
    dst.parent.mkdir(parents=True, exist_ok=True)
    if dst.exists() or dst.is_symlink():
        if dst.is_symlink() or dst.is_file():
            run(["rm", "-f", str(dst)])
        else:
            raise SystemExit(f"目标已存在且不是文件/软链，拒绝覆盖: {dst}")
    run(["ln", "-sf", str(src), str(dst)])


def install_skill_md(src: pathlib.Path, dst: pathlib.Path):
    """复制 SKILL.md 并改写仓库相对链接为同目录文件名（安装目录下再放规则软链）。"""
    if not src.exists():
        raise SystemExit(f"源文件不存在: {src}")
    dst.parent.mkdir(parents=True, exist_ok=True)
    text = src.read_text(encoding="utf-8")
    for doc in docs:
        fn = doc["file"]
        text = text.replace(f"](../../../{fn})", f"]({fn})")
    if dry:
        print(f"[dry-run] write {dst} ({len(text)} bytes)")
    else:
        dst.write_text(text, encoding="utf-8")


for name in sorted(selected):
    cfg = targets_cfg[name]
    root = expand(cfg["root"])
    layout = cfg["layout"]
    for sk in skills:
        sid = sk["id"]
        rel = pathlib.Path(sk["source"])
        src_dir = repo / rel
        skill_md = src_dir / "SKILL.md"
        if layout == "flat":
            dst_dir = root / sid
        elif layout == "category":
            cat = cfg.get("category") or "misc"
            dst_dir = root / cat / sid
        else:
            raise SystemExit(f"未知 layout: {layout}")
        install_skill_md(skill_md, dst_dir / "SKILL.md")
        for doc in docs:
            fn = doc["file"]
            src_doc = repo / doc["source"]
            link_doc(src_doc, dst_dir / fn)
    print(f"OK target={name} -> {root}")

for entry in custom:
    label = entry.get("label", "custom")
    root = expand(entry["root"])
    layout = entry.get("layout", "flat")
    for sk in skills:
        sid = sk["id"]
        src_dir = repo / pathlib.Path(sk["source"])
        skill_md = src_dir / "SKILL.md"
        if layout == "flat":
            dst_dir = root / sid
        elif layout == "category":
            cat = entry.get("category", "misc")
            dst_dir = root / cat / sid
        else:
            raise SystemExit(f"未知 custom layout: {layout}")
        install_skill_md(skill_md, dst_dir / "SKILL.md")
        for doc in docs:
            fn = doc["file"]
            src_doc = repo / pathlib.Path(doc["source"])
            link_doc(src_doc, dst_dir / fn)
    print(f"OK custom={label} -> {root}")
PY

echo "完成。Hermes/OpenClaw/Cursor 请各重启一次对应客户端以刷新技能发现。"
