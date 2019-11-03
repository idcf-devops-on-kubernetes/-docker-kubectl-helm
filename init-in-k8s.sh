#!/bin/sh

kubectl config set-cluster kube --server=https://$KUBERNETES_SERVICE_HOST:$KUBERNETES_SERVICE_PORT --certificate-authority=/var/run/secrets/kubernetes.io/serviceaccount/ca.crt  1>/dev/null
kubectl config set-context kube --cluster=kube  1>/dev/null
kubectl config set-credentials user --token="$(cat /var/run/secrets/kubernetes.io/serviceaccount/token)" 1>/dev/null
kubectl config set-context kube --user=user  1>/dev/null
kubectl config use-context kube --namespace "$(cat /var/run/secrets/kubernetes.io/serviceaccount/namespace)" 1>/dev/null