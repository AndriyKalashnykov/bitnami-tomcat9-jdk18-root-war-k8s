#!/bin/bash

set -x

. ./set-env.sh

date=$(date '+%Y-%m-%d')

kubectl exec $POD_NAME -n $NS_NAME cat /opt/bitnami/tomcat/conf/server.xml | grep 'from config-map'
kubectl exec $POD_NAME -n $NS_NAME cat /opt/bitnami/tomcat/conf/server.xml | grep '8019'
kubectl exec $POD_NAME -n $NS_NAME -- curl -s http://localhost:8080/example/
kubectl exec $POD_NAME -n $NS_NAME cat /opt/bitnami/tomcat/logs/catalina.${date}.log | grep 'JVM Version'
kubectl exec $POD_NAME -n $NS_NAME cat /opt/bitnami/tomcat/logs/catalina.${date}.log | grep 'APR'
kubectl exec $POD_NAME -n $NS_NAME cat /opt/bitnami/tomcat/webapps/manager/META-INF/context.xml
kubectl exec $POD_NAME -n $NS_NAME cat /opt/bitnami/tomcat/webapps/host-manager/META-INF/context.xml
kubectl exec $POD_NAME -n $NS_NAME -- curl -s -u $TOMCAT_USERNAME:$TOMCAT_PASSWORD http://localhost:$TOMCAT_PORT/host-manager/text/list
kubectl exec $POD_NAME -n $NS_NAME -- curl -s -u $TOMCAT_USERNAME:$TOMCAT_PASSWORD http://localhost:$TOMCAT_PORT/manager/text/list
kubectl exec $POD_NAME -n $NS_NAME -- curl -s -u $TOMCAT_USERNAME:$TOMCAT_PASSWORD http://localhost:$TOMCAT_PORT/manager/status/all?XML=true | xmlstarlet format --indent-tab
