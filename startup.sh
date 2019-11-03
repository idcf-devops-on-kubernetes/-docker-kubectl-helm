#!/bin/sh

set +x

if [ ! -z "$KUBERNETES_SERVICE_HOST" ]; then
    /var/init/init-in-k8s.sh
fi

/usr/local/bin/kubectl $@
