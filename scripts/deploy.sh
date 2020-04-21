#!/bin/bash

. ./set-env.sh

set -x
set -e

kubectl create configmap tomcat-conf-cm -n $NS_NAME --from-file=../tomcat/conf/server.xml --from-file=../tomcat/conf/context.xml --from-file=../tomcat/conf/localhost.crt --from-file=../tomcat/conf/localhost.key 

kubectl create -f ../k8s/pod.yaml -n $NS_NAME
kubectl create -f ../k8s/svc.yaml -n $NS_NAME
