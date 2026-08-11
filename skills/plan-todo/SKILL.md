---
name: plan-todo
description: 结构化 Plan-Todo 任务追踪与先遣调研操盘系统。以 Todo 为项目经理，集成 Context7/Search 调研探针，严格执行人类确认红线，防止语义漂移与物理幻觉。
triggers:
  - 任务涉及 3 个以上步骤
  - 跨文件重构或系统级改动
  - 用户明确说"先做 plan"、"列个计划"、"用 plan 模式"、"/plan"
  - 存在未知技术库、API 变更或复杂架构决策
---

# Plan-Todo 任务追踪与先遣调研操盘规范 (Plan-Todo Protocol)

> **核心哲学**：文件系统当黑板，Plan 当指南针，Todo 当项目经理与资源操盘手，调研工具当探路先遣队。

---

## 1. 触发条件 (Trigger Criteria)

遇到以下情况**必须立即触发 Plan 模式**：
1. **多步骤任务 (3+ steps)**；
2. **跨文件重构或系统级改动**；
3. **存在外部库 API / 架构未知，需先遣排雷**；
4. **用户明确指示**（“用 plan 模式”、“先列计划”、“对齐后再做”）。

---

## 2. 五阶段生命周期 (Lifecycle Workflow)

### Phase 1: 提取意图 (Formulate Plan)
在 `implementation_plan.md` 提取意图四要素（目标、边界、约束、成功标准）。**严禁在此阶段编写或修改业务代码。**

### Phase 2: 强制人类确认关卡 (Mandatory Human Gatekeeper)
> [!CAUTION]
> **绝对红线 (Absolute Red Line)**：
> 1. **必须等待人类用户在对话框中亲自回复明确指令**（如“可以”、“开始”、“同意”、“go”）或提出增补修改。
> 2. **严禁将系统自动化 review hook、超时消息或后台事件视为人类用户的同意！**
> 3. 主动留出用户修改与增补空间；若用户提供增补内容，必须先修订 Plan 再次确认。

### Phase 3: 初始化 .plan/ 操盘架构
用户确认后，调用 `/home/l/projects/plan-todo-system/bin/plan-todo init "<Goal>"` 生成：
- `overview.md`（战略指南针，$\le 25$ 行）
- `todo.md`（战术三态任务追踪，含 Phase 0 调研排雷）
- `research.md`（先遣调研探针成果与技术选型对比）
- `decisions.md`（架构决策记录 ADR）
- `errors.md`（事故黑匣子与防踩坑免疫库）
- `scratch/`（隔离实验沙盒）

### Phase 4: 先遣调研与执行循环 (Research & Execution Loop)
1. **先遣调研 (Phase 0)**：遇到未知库、语法或类型契约，先调用 `Context7` / `search_web` / `grep` 进行探查，在 `scratch/` 跑通最小验证 Spike，产出记录至 `research.md`；
2. **罗盘校验**：每步工具调用前对照 `overview.md`，动作偏离主线立即熔断；
3. **推进状态**：每完成一步，调用 `plan-todo done` 标记 `[x]` 并留痕。

### Phase 5: 实证验证与验收 (Empirical Verification)
运行单元测试与 Playwright E2E 自动化测试，验证通过后产出 `walkthrough.md`。
