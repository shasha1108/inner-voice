# 流程 E：自动选题入库

> 触发：`/inner-voice 自动选题`
> 加载时机：触发流程 E 时必读全部


---

## 流程 E：自动选题入库

> 触发：`/inner-voice 自动选题`（定时任务专用 · 无人值守）
>
> 📖 完整流程（前置检查、STEP 0 静默执行、筛选入库、邮件汇总、失败处理）→ Read `references/auto-pipeline.md`
>
> **定时：** `conf/schedule`（1 行，`HH:MM` 格式）。改时间 → 编辑该文件 → 用 CronCreate 重建定时任务。

