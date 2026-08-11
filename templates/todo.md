# Tactical Task Tracking (战术任务追踪)

## Phase 0: 调研排雷与架构契约确认 (Research & Spike)
- [ ] 0.1 使用 Context7 / search_web 调研技术选型与最新 API 规范并记录至 `.plan/research.md`
- [ ] 0.2 在 `scratch/` 进行最小可行性验证 (Spike Test) 验证核心路径

## Phase 1: 核心数据与底层服务 (Data & Service Layer)
- [ ] 1.1 定义并规范数据结构/API 端点（带严格类型嗅探防 NaN）
- [ ] 1.2 编写底层服务与数据管道

## Phase 2: 业务组件与交互组装 (Components & UI)
- [ ] 2.1 封装核心原子组件（支持暗色主题与 Resize 自适应）
- [ ] 2.2 组装顶层页面视图并注册全局导航路由

## Phase 3: 全链路实证验证与验收 (Empirical Verification)
- [ ] 3.1 编写并运行 Playwright E2E 自动化测试脚本
- [ ] 3.2 运行全量静态类型检查与构建回归
- [ ] 3.3 输出复盘与验证记录 (`walkthrough.md`)
