#!/bin/bash

. ./set-env.sh

set -x

if [ ! -z "$1" ]
then
    kubectl delete -f $K8S_DIR/$1/pod.yaml -n $NS_NAME
    kubectl delete -f $K8S_DIR/$1/svc.yaml -n $NS_NAME
    kubectl delete configmap tomcat-conf-cm -n $NS_NAME
fi