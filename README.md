# Plan + Todo — LLM Agent 任务追踪系统

> 一句话：**文件系统当黑板，Plan 当指南针，Todo 当坐标。** 任何 AI 编码助手装上就能用。

## 解决什么问题

LLM agent 每个 turn 无状态。用户说"移植这个仓库"，然后 agent 开始干——干了 3 轮之后，用户的原始意图（1 行）被 git 报错、shell 输出、npm 日志（50 行）淹没在 context 里。agent 开始追着报错修，忘了最开始要干什么。

**语义漂移**。

这个系统用一个简单的文件结构解决它——每步执行前对照 `.plan/overview.md`，确保方向不偏。

## 30 秒安装

```bash
# 在你的项目根目录
mkdir -p .plan
cp templates/overview.md .plan/
cp templates/todo.md .plan/
cp templates/decisions.md .plan/
cp templates/errors.md .plan/
```

然后把 `BOOTSTRAP.md` 的规则部分粘贴到 AI 工具的配置文件中：

| 工具 | 配置文件 |
|------|---------|
| Claude Code | 项目根 `CLAUDE.md` |
| Codex (OpenAI) | 项目根 `AGENTS.md` |
| Gemini | 项目根 `.gemini/GEMINI.md` |
| Hermes | 项目根 `.hermes/rules.md` |
| Cursor | `.cursor/rules/plan-todo.md` |
| 通用 | 工具的系统提示词 / custom instructions |

## 怎么用

跟平时一样跟 AI 说话。遇到复杂任务（3+ tool calls），AI 会自动：

1. 提取意图 → 等你说"可以"
2. 写 `.plan/overview.md`
3. 每步对照 plan 执行
4. 做完更新进度

你也可以手动触发：说 **"用 plan 模式"** 或 **"/plan"**。

## 文件说明

```
.plan/
├── overview.md        ← 意图摘要，≤25行，每步前必读
├── todo.md            ← [ ] 待做 / [~] 在做 / [x] 完成
├── decisions.md       ← 关键决策日志
└── errors.md          ← 踩坑记录，防止重复
```

完整方法论见 [`PLAN_SYSTEM.md`](./PLAN_SYSTEM.md)。

## 对照：用 vs 不用

| | 不用 Plan | 用 Plan |
|---|---|---|
| Agent 行为 | 追着报错修，离原始意图越来越远 | 每步前对 plan，偏了就停 |
| 新会话 | 忘光，从头开始 | 读 `.plan/` 恢复上下文 |
| 用户体验 | 反复纠正 agent | 确认一次，全程跑通 |
| 适用场景 | 单文件小改 | 多步骤开发、跨文件重构 |

## License

MIT — 随便用，随便改，随便分发。
