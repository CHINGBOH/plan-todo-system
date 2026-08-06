# Plan-Todo Protocol — 一键激活

> 把下面的规则粘贴到 AI 工具的配置文件中。
> Claude Code → `CLAUDE.md`，Codex → `AGENTS.md`，Gemini → `.gemini/GEMINI.md`。
> 粘贴后说 `/plan` 或 "用 plan 模式" 即可触发。

---

## Plan 纪律（最高优先级）

**多步骤任务（3+ tool calls）必须先过 `.plan/` 系统：**

1. 用户给出复杂任务 → 提取结构化意图（目标/阶段/边界/约束）→ **等用户确认后再动手**
2. 确认后创建 `.plan/` 目录，写入 overview.md（≤25行）和 todo.md
3. 执行前检查 `.plan/overview.md` 是否存在且有未完成项 → 先恢复上下文
4. **每轮工具调用前**对照 `overview.md`：当前动作是否服务于 plan 的方向？
5. 方向不一致 → 停下来问用户，不要惯性执行
6. 每步完成后更新 `todo.md` 对应 checkbox（[ ] → [~] → [x]）

## 文件结构

```
.plan/
├── overview.md        ← 用户确认的意图摘要（≤25行）
├── todo.md            ← [ ] 待做 / [~] 在做 / [x] 完成
├── decisions.md       ← 关键决策 + 为什么
└── errors.md          ← 踩过的坑，下次别踩
```

## 新会话恢复

如果 `.plan/overview.md` 存在且 `todo.md` 有未完成项：
1. 读 `overview.md` 恢复上下文
2. 读 `todo.md` 找到断点
3. 读 `decisions.md` 和 `errors.md` 了解历史

## 反模式

- 用户没确认就执行 ← 最严重
- overview.md 超过 25 行
- 被工具输出噪音带偏，忘记原始意图
- 一直追着报错修而不回到 plan 看方向

---

完整文档见 [`PLAN_SYSTEM.md`](./PLAN_SYSTEM.md)
