#!/bin/bash

. ./set-env.sh

set -x

kubectl delete -f $K8S_DIR/pod.yaml -n $NS_NAME
kubectl delete -f $K8S_DIR/svc.yaml -n $NS_NAME
kubectl delete configmap tomcat-conf-cm -n $NS_NAME
