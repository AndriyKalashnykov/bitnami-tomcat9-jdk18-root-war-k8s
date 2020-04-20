#!/bin/bash

. ./set-env.sh

set -x

kubectl delete -f ../k8s/pod.yaml -n $NS_NAME
kubectl delete -f ../k8s/svc.yaml -n $NS_NAME
kubectl delete configmap tomcat-conf-cm -n $NS_NAME
