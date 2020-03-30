
# Kubectl 命令行工具

此仓库的 Dockerfile 可用于生成包含下列工具的容器镜像：

1. bash  很多 alpine 镜像中是不包含 bash 的
2. Docker 也就是 Docker in Docker 模式的 Docker
3. kubectl 当运行在 Kubernetes 环境中时，可自动根据 Kubernetes 提供的 Service Account 完成 ~/.kube/config 的配置

目前，此镜像已发布在 [Docker Hub](https://hub.docker.com/r/jijiechen/docker-kubectl-helm) 上。