#!/bin/bash

. ./set-env.sh

set -x
set -e

cd ../k8s

kubectl create configmap tomcat-conf-cm -n $NS_NAME --from-file=../tomcat/conf/server.xml --from-file=../tomcat/conf/context.xml --from-file=../tomcat/conf/localhost.crt --from-file=../tomcat/conf/localhost.key 

kubectl create -f pod.yaml -n $NS_NAME
kubectl create -f svc.yaml -n $NS_NAME

cd ../scripts