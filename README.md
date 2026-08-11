# Plan + Todo — LLM Agent 任务追踪与先遣调研操盘系统

> **一句话**：**文件系统当黑板，Plan 当指南针，Todo 当项目经理与资源操盘手，调研工具当探路先遣队。** 任何 AI 编码助手装上即可消除语义漂移与技术幻觉。

---

## 🎯 核心解决的问题

1. **语义漂移 (Context Drift)**：随着工具调用增多，原始意图被海量 shell 日志、报错信息淹没，Agent 开始追着报错盲目打补丁；
2. **技术幻觉与先验盲目 (Hallucinations)**：Agent 凭概率猜测第三方库的 API、数据库字段类型，写了一堆代码在运行时报废；
3. **缺少战略锚点 (Loss of Focus)**：缺乏顶层约束，Todo 沦为一盘散沙。

本系统通过 **「战略指南针 + 战术三态坐标 + 先遣调研武器库 + 物理沙盒排雷」** 四位一体彻底解决上述问题。

---

## 🚀 30 秒快速上手

### 1. 使用内置 CLI 工具（推荐，零外部依赖）

```bash
# 添加至环境变量或直接调用
alias plan-todo="/home/l/projects/plan-todo-system/bin/plan-todo"

# 在项目根目录一键初始化
plan-todo init "构建电商可视化大屏"

# 查看当前阶段、执行焦点与彩色进度条
plan-todo status

# 派发先遣调研任务（手握 Context7 / search_web）
plan-todo research "ECharts 5 桑基图与 TypeScript 6 配置"

# 创建快速验证沙盒（不污染主工程）
plan-todo spike "test_pg_connection"

# 规范检查（强制校验 overview ≤ 25 行与三态规范）
plan-todo lint

# 推进任务
plan-todo done "1.1"
```

### 2. 纯文件安装

```bash
# 在你的项目根目录运行安装脚本
bash /home/l/projects/plan-todo-system/install.sh
```

---

## 📂 文件架构说明

```
.plan/
├── overview.md        ← 战略指南针（≤25行），北极星目标、阶段、边界与约束
├── todo.md            ← 战术任务追踪：[ ] 待做 / [~] 正在执行 / [x] 已完成
├── research.md        ← 技术调研与先遣排雷记录（Context7/Search 成果）
├── decisions.md       ← 架构决策记录（ADR：日期 · 决策 · 为什么）
├── errors.md          ← 事故黑匣子与防踩坑记录（根因 · 怎么避免）
└── scratch/           ← 隔离实验沙盒（用于跑最小 POC 验证）
```

---

## 🏛️ 详细文档

- 📖 [**完整方法论体系 (PLAN_SYSTEM.md)**](./PLAN_SYSTEM.md)：Todo 作为 PM、WBS 100% 穷尽法则、四大经典领域模板库。
- 🔍 [**调研工具实战操盘手册 (RESEARCH_PLAYBOOK.md)**](./RESEARCH_PLAYBOOK.md)：Context7、Web Search、AST Grep 与沙盒排雷实战。
- 🚀 [**各主流 AI 助手接入配置 (BOOTSTRAP.md)**](./BOOTSTRAP.md)：适配 Claude Code、Codex、Gemini、Cursor。

---

## ⚖️ 对照：用 vs 不用

| 维度 | 不用 Plan 系统 | 装备 Plan + Todo + 调研体系 |
|---|---|---|
| **面对复杂未知** | 盲目直接写代码，写错再修，频繁返工 | **Phase 0 先遣调研**，查清 API 与 Schema 再落子 |
| **Agent 行为** | 追着报错修，离原始意图越来越远 | 每步前对齐 `overview.md`，偏离立即熔断 |
| **人类把关** | Agent 擅自抢跑改代码 | **强制人类明确确认红线**，支持用户动态增补 |
| **新会话断点** | 忘光历史，从头开始 | 读 `.plan/` 1 秒恢复上下文与执行坐标 |

---

## 📜 License
MIT — 自由使用、分发与修改。
