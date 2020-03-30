FROM dockerhub.azk8s.cn/library/docker:dind

LABEL maintainer="jijie.chen@outlook.com"
LABEL org.label-schema.vcs-url="https://github.com/jijiechen/kubectl"

# Install kubectl
# Note: Latest version may be found on:
# https://aur.archlinux.org/packages/kubectl-bin/
ADD https://storage.googleapis.com/kubernetes-release/release/v1.16.0/bin/linux/amd64/kubectl /usr/local/bin/kubectl
ADD ./init-in-k8s.sh /var/init/init-in-k8s.sh
RUN chmod +x /var/init/init-in-k8s.sh

ADD ./startup.sh /var/init/startup.sh
RUN chmod +x /var/init/startup.sh

ENV HOME=/config

RUN set -x && \
    apk add --no-cache bash curl ca-certificates && \
    chmod +x /usr/local/bin/kubectl

RUN apk add --update --no-cache curl ca-certificates && \
    curl -L https://get.helm.sh/helm-v3.1.2-linux-amd64.tar.gz | tar xvz && \
    mv linux-amd64/helm /usr/bin/helm && \
    chmod +x /usr/bin/helm && \
    rm -rf linux-amd64 && \
    apk del curl && \
    rm -f /var/cache/apk/*


ENTRYPOINT ["/var/init/startup.sh"]
