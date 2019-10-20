FROM alpine:3.8

LABEL maintainer="jijie.chen@outlook.com"
LABEL org.label-schema.vcs-url="https://github.com/jijiechen/kubectl"
LABEL org.label-schema.version="v1.16.0"


# Install kubectl
# Note: Latest version may be found on:
# https://aur.archlinux.org/packages/kubectl-bin/
ADD https://storage.googleapis.com/kubernetes-release/release/v1.16.0/bin/linux/amd64/kubectl /usr/local/bin/kubectl
ADD ./init-kubectl.sh ./var/init/init-kubectl.sh

ENV HOME=/config

RUN set -x && \
    apk add --no-cache curl ca-certificates && \
    chmod +x /usr/local/bin/kubectl && \
    \
    # Create non-root user (with a randomly chosen UID/GUI).
    adduser kubectl -Du 2342 -h /config && \
    \
    # Basic check it works.
    kubectl version --client

USER kubectl

ENTRYPOINT ["./var/init/init-kubectl.sh"]