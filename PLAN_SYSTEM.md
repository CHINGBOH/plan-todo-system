# Plan + Todo 任务追踪系统 — 完整方法论

> 工具无关。适用于任何 LLM 编码助手。

## 问题：语义漂移

LLM agent 是无状态的。每个 turn，context 由 harness 重新组装。用户说的"把这个仓库移植过去"是一句话（1 行），但随着 agent 执行，git push 报错、stash 冲突、npm install 日志——这些噪音（50 行）会逐步淹没原始意图。

Agent 开始追着报错修，每个"解决当前问题"都是合理行为，但离原始目标越来越远。

## 原理：文件系统当黑板

把意图和进度存在文件里，不依赖 agent 的"记忆"（它没有记忆）。

```
context = 文件系统（持久） + 对话历史（递增噪音）
```

Plan 和 Todo 是结构性内容——LLM 做 context 摘要时大概率保留它们，不会被裁掉。

## 工作流（5 步完整版）

### Step 1: 提取意图（Agent 输出）

用户：把 sql-engine-lab 做成教学平台

Agent 输出（**不要执行**）：

```
目标：把 sql-engine-lab 从 SQL 执行器升级为完整 SQL 教学练手平台
阶段：
  1. 补齐 SQL 示例库（常用查询全覆盖）
  2. 表设计原则 + 字段规范（含反模式对比）
  3. 练习模式（看题写 SQL → 判对错）
边界：不改 DB schema、不加用户系统、不换技术栈
约束：Express + Monaco + PostgreSQL、单页、无框架
```

### Step 2: 用户确认（等待）

Agent 必须等待用户明确说"可以"、"开始"、"go"、"对的"。
确认前不动任何代码、不创建任何文件。

### Step 3: 写入 Plan

确认后创建 `.plan/` 目录：

**overview.md**（≤25 行，只含目标/阶段/边界/约束/当前状态）：
```markdown
# Plan Overview

## 目标
sql-engine-lab → SQL 教学练手平台

## 阶段
1. 补齐 SQL 示例库
2. 表设计原则 + 字段规范
3. 练习模式

## 边界
不改 DB schema、不加用户系统

## 当前状态
Phase 1 进行中
```

**todo.md**（从概述拆解为具体步骤，`[ ]` 标记）：
```markdown
# Todo

- [~] Phase 1: 补齐 SQL 示例库
  - [ ] 1.1 调研常用 SQL
  - [ ] 1.2 前端新增示例
- [ ] Phase 2: 表设计原则
- [ ] Phase 3: 练习模式
```

### Step 4: 执行循环

**每步工具调用前：**
1. 读 `overview.md` — 现在在哪个阶段？
2. 读 `todo.md` — 下一步做什么？
3. 当前动作跟 overview 方向一致吗？不一致 → 停下来问用户

**每步完成后：**
1. 更新 `todo.md` 对应项 `[ ]` → `[x]`
2. 有重要决策 → 追加到 `decisions.md`（格式：日期 · 决策 · 为什么）
3. 遇到错误 → 追加到 `errors.md`（格式：日期 · 错误 · 根因 · 怎么避免）

### Step 5: 完成

全部 `[x]` 后报告。保留 `.plan/` 目录——下个会话可能需要参考。

## 多会话恢复

新会话启动时：

```
if .plan/overview.md 存在 and todo.md 有未完成项:
    1. 读 overview.md → 恢复上下文
    2. 读 todo.md → 找到断点（第一个 [ ] 或 [~]）
    3. 读 decisions.md → 了解历史决策
    4. 读 errors.md → 避免重复踩坑
```

## 适用场景判断

### 用 Plan 模式
- 多步骤功能开发（3+ distinct steps）
- 跨文件重构
- 需求模糊，需要先对齐再动手
- 长任务容易"跑偏"

### 不用 Plan 模式
- 简单问答（"这个函数什么意思"）
- 单文件小改（"改个变量名"）
- 纯信息查询（"这个表有多少行"）

## 真实案例：sql-engine-lab 升级

**不用 Plan（预测行为）**：
Agent 说"好的" → 开始改 HTML → 中途想加 CSS → 又去改 server.js → git 报错 → 修 git → 用户纠正 → Agent 又往另一个方向跑

**用 Plan（实际发生）**：
1. 用户说需求 → Agent 提取 3 阶段意图 → 用户确认
2. Phase 1：15 分钟，45→100+ 示例，新增 4 个标签页 ✅
3. Phase 2：10 分钟，设计面板 6 个专题 ✅
4. Phase 3：10 分钟，11 道分级练习题 + 即时判对错 ✅
5. 全程无偏航，一次跑通

## 模板

见 `templates/` 目录下的 4 个模板文件。复制到项目 `.plan/` 即可。

## 适配各工具的注意事项

| 工具 | 特殊配置 |
|------|---------|
| Claude Code | 支持 `TaskCreate`/`TaskUpdate`，可以双轨：Plan + 原生 Task 列表 |
| Codex | 读文件能力强，建议每步明确说"Read .plan/overview.md" |
| Gemini | context window 大，overview 可以稍微宽松（30 行） |
| Hermes | 如果有 hooks，可以配 PreToolUse 自动注入 overview |

核心协议不依赖任何 API feature。文件系统是所有工具的共同语言。
