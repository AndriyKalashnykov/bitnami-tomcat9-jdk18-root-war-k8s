#!/bin/bash

. ./set-env.sh

set -x
set -e

if [ ! -z "$1" ]
then
    kubectl create configmap tomcat-conf-cm -n $NS --from-file=$TOMCAT_CONF/tomcat-users.xml --from-file=$TOMCAT_CONF/server.xml --from-file=$TOMCAT_CONF/context.xml --from-file=$TOMCAT_CONF/localhost.crt --from-file=$TOMCAT_CONF/localhost.key 

    kubectl create -f $K8S_DIR/$1/pod.yaml -n $NS
    kubectl create -f $K8S_DIR/$1/svc.yaml -n $NS
fi