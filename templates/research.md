# Technical Research & De-risking Record (技术调研与先遣排雷记录)

> **Purpose**: Managed by the Todo List as PM to eliminate LLM hallucinations, explore API contracts, and de-risk unknown technical areas before code execution. (由 Todo List 统筹调度，在动手写代码前查清事实，杜绝幻觉与试错浪费)。

---

## 🔍 Research Topic: [Topic Title / 调研主题]

- **Associated Todo Item (关联任务)**: `Phase X.X - [Task Name]`
- **Driver / Question (核心疑问与待探明问题)**:
  - *What is the exact API signature / configuration contract? (具体的 API 签名与配置契约是什么？)*
  - *Are there version breaking changes (e.g. React 19 / ECharts 5 / TypeScript 6)? (是否存在版本破坏性变更？)*
  - *What are the edge cases / type pitfalls (e.g. PostgreSQL numeric/bigint string serialization)? (存在哪些类型或边界陷阱？)*

---

### 🛠️ Probing Tools Summoned (调用的调研探针)

- [ ] **Context7 MCP**: `resolve-library-id` $\rightarrow$ `query-docs` (Official library documentation)
- [ ] **search_web**: Industry best practices, recent issues, and bug trackers
- [ ] **Codebase Grep (`grep_search` / `ripgrep`)**: Local schema, existing callers, and data models
- [ ] **Scratch Sandbox (`scratch/`)**: Minimal viable prototype (Spike POC)

---

### 📊 Comparative Analysis & Findings (调研结果与选型对比)

| 方案 / 选型 (Options) | 优势 (Pros) | 劣势/风险 (Cons & Risks) | 结论与适用性 (Verdict) |
|---|---|---|---|
| **Option A (推荐)** | | | ✅ 选定方案 |
| **Option B** | | | ❌ 放弃理由 |

---

### 🎯 Actionable Plan Items for `todo.md` (调研产出：直接转化的 Todo 执行动作)

1. `[ ] Step X.1`: [Concrete action derived from research findings]
2. `[ ] Step X.2`: [Type casting / defensive guard implementation]
3. `[ ] Step X.3`: [Verification test case for this specific edge case]

---

### 📝 Decision Record (决策留痕)
*Summary of decision added to `.plan/decisions.md` on YYYY-MM-DD.*
