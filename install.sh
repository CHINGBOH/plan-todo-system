#!/bin/bash
# Plan + Todo 快速安装脚本
# 在你的项目根目录运行: bash /path/to/plan-todo-system/install.sh
set -e

SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"

echo "=== Plan + Todo 安装 ==="
echo ""

# 1. 创建 .plan/ 目录并复制模板
if [ -d ".plan" ]; then
  echo "[跳过] .plan/ 已存在"
else
  mkdir -p .plan/scratch
  cp "$SCRIPT_DIR/templates/overview.md" .plan/
  cp "$SCRIPT_DIR/templates/todo.md" .plan/
  cp "$SCRIPT_DIR/templates/research.md" .plan/
  cp "$SCRIPT_DIR/templates/decisions.md" .plan/
  cp "$SCRIPT_DIR/templates/errors.md" .plan/
  echo "[完成] .plan/ 核心模板已创建（含 research.md 先遣调研排雷模板）"
fi

# 2. 检测项目类型，给出配置建议
echo ""
echo "--- 下一步：激活 AI 工具的 Plan 纪律 ---"
echo ""

if [ -f "CLAUDE.md" ]; then
  echo "[检测到] Claude Code — 把 BOOTSTRAP.md 规则粘贴到 CLAUDE.md 顶部"
fi
if [ -f "AGENTS.md" ]; then
  echo "[检测到] Codex — 把 BOOTSTRAP.md 规则粘贴到 AGENTS.md"
fi
if [ -d ".gemini" ] || [ -f "GEMINI.md" ]; then
  echo "[检测到] Gemini — 把 BOOTSTRAP.md 规则粘贴到 .gemini/GEMINI.md"
fi
if [ -d ".hermes" ]; then
  echo "[检测到] Hermes — 把 BOOTSTRAP.md 规则粘贴到 .hermes/rules.md"
fi
if [ -d ".cursor" ]; then
  echo "[检测到] Cursor — 把 BOOTSTRAP.md 规则粘贴到 .cursor/rules/plan-todo.md"
fi

echo ""
echo "BOOTSTRAP.md 位置: $SCRIPT_DIR/BOOTSTRAP.md"
echo "完整文档: $SCRIPT_DIR/PLAN_SYSTEM.md"
echo ""
echo "安装完成！下次跟 AI 说 '用 plan 模式' 或 '/plan' 即可触发。"
