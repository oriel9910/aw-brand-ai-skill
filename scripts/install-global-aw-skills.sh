#!/usr/bin/env bash
# 兼容旧文档：等同于只安装 Cursor 全局。
# 新入口请用：scripts/install-agent-skill-links.sh

set -euo pipefail
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
exec bash "$SCRIPT_DIR/install-agent-skill-links.sh" --targets cursor "$@"
