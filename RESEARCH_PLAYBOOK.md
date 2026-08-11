# Research Toolkit & De-risking Playbook (调研工具实战操盘手册)

> **Core Axiom**: The Todo List is the Project Manager and Resource Controller. Research tools are its sensory scouts and de-risking compass. Never start coding on an unknown without probing physical reality first. (Todo List 是操盘手，调研工具是探路仪；不打无准备之仗，先调研排雷后施工)。

---

## 🏛️ 1. The 4-Pillar Research Toolkit (四大先遣调研工具)

When a task item in `todo.md` touches new libraries, complex architectures, data schemas, or unfamiliar APIs, the Todo List immediately dispatches one or more of the following 4 probing tools:

```
                                  ┌────────────────────────────────────────────────────────┐
                                  │      🎯 Todo List (PM & 资源操盘手)                     │
                                  └──────────────────────────┬─────────────────────────────┘
                                                             │
         ┌───────────────────────────────────┬───────────────┴───────────────┬───────────────────────────────────┐
         ▼                                   ▼                               ▼                                   ▼
┌─────────────────────────────────┐ ┌─────────────────────────────────┐ ┌─────────────────────────────────┐ ┌─────────────────────────────────┐
│ 1. 外部权威文档 (Context7)      │ │ 2. 行业与前沿情报 (Search Web)  │ │ 3. 本地代码与系统感知 (Grep)    │ │ 4. 隔离实验沙盒 (Spike Sandbox) │
│ • 查 React 19/ECharts 最新语法  │ │ • 查开源 Issue / 破坏性变更     │ │ • 查系统 Schema / 跨文件调用链  │ │ • 在 .plan/scratch/ 跑最小 POC │
│ • 消除 API 签名与配置幻觉       │ │ • 寻找行业成熟架构最佳实践      │ │ • 严格嗅探字段类型防 NaN 空白   │ │ • 验证通过后再合入生产主干      │
└─────────────────────────────────┘ └─────────────────────────────────┘ └─────────────────────────────────┘ └─────────────────────────────────┘
```

---

## 🛠️ 2. Research Workflow: Phase 0 as Standard Protocol (阶段 0 调研排雷规范)

For every non-trivial milestone or module, the Todo List mandates a **Phase 0 Research & Spike Subtask**:

```markdown
## Phase 0: 调研排雷与架构契约确认 (Research & Spike)
- [ ] 0.1 调取 Context7 查阅最新库 API 规范，记录至 `.plan/research.md`
- [ ] 0.2 使用 grep_search 校验数据库真实 Schema 字段类型
- [ ] 0.3 在 `.plan/scratch/` 运行最小验证脚本（Spike POC）确认核心链路可行性
```

---

## 🔍 3. Probing Tools Usage Guide (具体工具调用指南)

### 3.1 Context7 Documentation Probing (官方权威文档探针)
- **When to use**: Whenever using a third-party framework/SDK (React, Next.js, ECharts, Tailwind, Prisma, D3, PySpark).
- **Protocol**:
  1. `resolve-library-id`: Resolve library name (e.g. `echarts` $\rightarrow$ `/apache/echarts`).
  2. `query-docs`: Query targeted topic (e.g. `sankey series options`, `resize observer`).
  3. Record verified option keys directly into `research.md`.

### 3.2 Web Search & Intelligence (`search_web`)
- **When to use**: When evaluating architectural trade-offs, looking up rare error codes, comparing library benchmarks, or checking CVE security advisories.
- **Protocol**: Focus search queries on precise technical keywords (e.g. `PostgreSQL numeric string serialization node-pg`).

### 3.3 Codebase & Schema Grep (`grep_search` / `ripgrep`)
- **When to use**: Checking actual table structures, foreign key constraints, or existing design systems.
- **Protocol**: Check `information_schema.columns` or grep types to prevent ID mismatch (e.g. `product_id` varchar vs integer).

### 3.4 Scratch Sandbox Spike (`bin/plan-todo spike <name>`)
- **When to use**: Before writing 200 lines of frontend/backend code that might fail on an unverified assumption.
- **Protocol**:
  1. Run `plan-todo spike quick_poc`.
  2. Write 15 lines of code in `.plan/scratch/quick_poc.py` to test the network call / SQL query / data parser.
  3. If it returns expected output, mark the spike done and proceed to write production code.

---

## 📝 4. Research Output Crystallization (调研成果转化闭环)

Every research session must produce concrete, actionable outputs:
1. **Log Findings**: Append to `.plan/research.md` using standard template.
2. **Derive Concrete Todo Steps**: Break research findings into specific, atomic `[ ]` items in `todo.md`.
3. **Record Architectural Trade-offs**: Write final chosen option into `.plan/decisions.md`.
4. **Prevent Regressions**: If an unexpected trap was discovered during research, log it immediately to `.plan/errors.md`.
