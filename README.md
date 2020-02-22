# omnibus-gitlab-docker

这是一个用来解决智障 PCI 安全检查不管 OpenSSH 小版本的 GitLab Docker，特性如下：

- 基于 GitLab 官方最新版的 CE docker 镜像（:latest），替换 OpenSSH 服务器
- 每 3 天（或我们认为有必要提前发布安全更新时）通过 GitHub Actions 自动编译，妈妈再也不怕没人更新了
