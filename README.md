# worker

基于 Go 1.22 与 Alpine 3.20 的轻量多阶段容器化后台 Worker 脚手架（已归档于 `archive/from-home/worker`）。

## 目录说明

- `Dockerfile`：双阶段静态编译构建（`CGO_ENABLED=0` 产出 `/worker` 二进制，非 root `app` 用户运行，内置 `ca-certificates` 与 `tzdata`）
- `test/`：归档工程结构完整性冒烟测试

## 目标平台（Target 判定）

- **移动端**：可选（服务端后台容器组件）
- **智能硬件**：可选（可搁置）

## 验证命令

```bash
npm test
```

## 归档说明

家用机迁入归档容器底座快照，默认只读维护。
