#!/bin/bash

. ./set-env.sh

set -x
set -e

if [ ! -z "$1" ]
then
    kubectl create configmap tomcat-conf-cm -n $NS_NAME --from-file=$TOMCAT_CONF/server.xml --from-file=$TOMCAT_CONF/context.xml --from-file=$TOMCAT_CONF/localhost.crt --from-file=$TOMCAT_CONF/localhost.key 

    kubectl create -f $K8S_DIR/$1/pod.yaml -n $NS_NAME
    kubectl create -f $K8S_DIR/$1/svc.yaml -n $NS_NAME
fi