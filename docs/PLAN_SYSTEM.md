# Plan + Todo 任务追踪系统 — 完整工程方法论 (Comprehensive Methodology)

> **核心哲学**：文件系统为记忆，Plan 为黑板与指南针，Todo 为坐标与项目经理，调研工具为探路先遣队。适用于所有主流 LLM 编码智能体（Claude Code、Codex、Gemini、Cursor 等）。

---

## 🎯 一、 解决什么问题：破除大模型语义漂移与物理幻觉

### 1. 语义漂移 (Context Drift)
LLM 每个 turn 是无状态的，随着工具调用增多，npm install 日志、git 报错、shell 堆栈会快速淹没最初的战略意图。Agent 容易陷入“追着报错盲目打补丁”的陷阱，偏离主线。

### 2. 物理幻觉与先验假设 (Hallucinations vs. Physical Constraints)
大模型的本质是概率想象，而工程落地的本质是物理确定性（有限的上下文、有限的连接池、严格的数据库类型系统）。**Todo List 就是将抽象意图转化为物理现实的确定性编译器。**

---

## 🏛️ 二、 Todo List 的角色定位：项目经理与资源操盘手

Todo List 绝非简单的打勾列表，它具有以下核心职责：

1. **战略锚定 (Strategy Anchor)**：时刻与 `overview.md` 的北极星目标和边界红线咬合，防止形散神散；
2. **资源调度 (Resource Allocation)**：把控 Token 预算、连接池开销与长耗时任务的异步调度；
3. **先遣调研 (Research Orchestration)**：手握 4 大调研工具（Context7、Web Search、AST Grep、Spike Sandbox），在开工前消除一切技术不确定性；
4. **质量门禁 (DoD Gatekeeper)**：严格执行实证验证，未通过测试绝不虚假勾选 `[x]`。

---

## 📐 三、 任务科学拆解四大原则 (WBS & Decomposition)

1. **WBS 100% 穷尽法则 (The 100% Rule)**：子任务集合必须 100% 覆盖父阶段目标，无多余、无遗漏；
2. **交付物导向 (Deliverable-Oriented)**：以“生成的文件、注册的路由、通过的测试”等客观交付物命名，而非“写代码”等模糊动词；
3. **粒度黄金分割律 (Atomic DoD)**：单一职责，每个条目对应一次独立的工具调用与断言闭环；
4. **依赖拓扑序 (Dependency DAG)**：严格遵循 `数据/API -> 组件 -> 页面集成 -> E2E 回归` 因果链编排。

---

## 🚀 四、 四大经典领域模板库 (Domain Archetypes)

| 业务场景 | 通用 Todo 拆解骨架 (Standard Archetype) |
|---|---|
| **🆕 1. 全新功能开发 (Feature Development)** | ① 调研与契约定义 $\rightarrow$ ② 核心原子组件/服务 $\rightarrow$ ③ 顶层视图串联 $\rightarrow$ ④ 异常分支防御 $\rightarrow$ ⑤ 自动化 E2E 验证 |
| **🔄 2. 架构重构/技术迁移 (Refactoring & Migration)** | ① 存量行为基准测试 (Baseline) $\rightarrow$ ② 双轨适配层 $\rightarrow$ ③ 增量替换核心实现 $\rightarrow$ ④ 废弃旧链路 $\rightarrow$ ⑤ 全链路性能回归 |
| **🐛 3. 复杂缺陷修复 (Bugfix & Root Cause)** | ① 最小失败复现用例 (Repro Test) $\rightarrow$ ② 根因定位与影响面评估 $\rightarrow$ ③ 实施修复补丁 $\rightarrow$ ④ 验证复现用例转绿 $\rightarrow$ ⑤ 补充边界防御测试 |
| **📊 4. 数据分析与算法 (Analytics & ML)** | ① 数据清洗与特征提取 $\rightarrow$ ② 算法模型训练/推断 $\rightarrow$ ③ 视觉编码与图表渲染 $\rightarrow$ ④ 业务指标评估 (AUC/Lift/CVR) |

---

## 📂 五、 标准文件系统结构

```
.plan/
├── overview.md        ← 战略指南针，≤25行，北极星目标、阶段、边界与约束
├── todo.md            ← 战术任务追踪：[ ] 待做 / [~] 进行中 / [x] 已完成
├── research.md        ← 技术调研与先遣排雷记录（Context7/Search/Spike 成果）
├── decisions.md       ← 架构决策记录（ADR：日期 · 决策 · 为什么）
├── errors.md          ← 事故黑匣子与防踩坑记录（根因 · 怎么避免）
└── scratch/           ← 隔离实验沙盒（用于跑最小 POC 验证）
```

---

## 🔄 六、 标准执行工作流（5 步闭环）

### Step 1: 提取意图与制定 Plan
Agent 提取目标、边界、约束、成功标准并输出 `implementation_plan.md`。**严禁在此阶段修改任何代码。**

### Step 2: 强制人类确认关卡（Mandatory Human Gatekeeper）
**绝对红线**：必须等待**人类用户在对话框中明确回复（“可以”、“开始”、“go”）**或提出增补修改。**严禁将自动化系统消息视为人类同意！**

### Step 3: 初始化 `.plan/`
运行 `plan-todo init "目标名称"`，一键生成标准骨架。

### Step 4: 执行与同步循环
1. 工具调用前：对照 `overview.md` 确认阶段，对照 `todo.md` 确认当前 `[~]` 焦点；
2. 遇到未知：运行 `plan-todo research` 调动调研探针查清事实；
3. 完成每步：运行 `plan-todo done` 更新进度，并在 `decisions.md` / `errors.md` 留痕。

### Step 5: 实证回归与交付
运行全量 E2E 自动化测试，验证通过后输出 `walkthrough.md`。
