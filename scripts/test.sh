#!/bin/bash

. ./set-env.sh

set -x

if [ ! -z "$1" ]
then

    kubectl get pod -w -n $NS_NAME

    SVC_NAME=svc-$1

    kubectl get svc $SVC_NAME -n $NS_NAME -w

    SVC_IP=$(kubectl get svc $SVC_NAME -n $NS_NAME --no-headers | awk '{print $4}' )

    echo "SVC_IP=$SVC_IP"
    POD_NAME=$1

    kubectl exec $POD_NAME -n $NS_NAME -- sh -c "cat /opt/bitnami/tomcat/conf/server.xml | grep 'from config-map'"
    kubectl exec $POD_NAME -n $NS_NAME -- sh -c " cat /opt/bitnami/tomcat/logs/catalina.*.log | grep 'JVM Version'"
    kubectl exec $POD_NAME -n $NS_NAME -- sh -c " cat /opt/bitnami/tomcat/logs/catalina.*.log | grep 'APR'"
    kubectl exec $POD_NAME -n $NS_NAME -- sh -c " cat /opt/bitnami/tomcat/webapps/manager/META-INF/context.xml"
    kubectl exec $POD_NAME -n $NS_NAME -- sh -c " cat /opt/bitnami/tomcat/webapps/host-manager/META-INF/context.xml"


    kubectl exec $POD_NAME -n $NS_NAME -- curl -k -s https://$SVC_IP/index.html
    
    kubectl exec $POD_NAME -n $NS_NAME -- curl -s -k -u $TOMCAT_USERNAME:$TOMCAT_PASSWORD https://$SVC_IP/manager/status/all?XML=true | xmlstarlet format --indent-tab
    kubectl exec $POD_NAME -n $NS_NAME -- curl -s -k -u $TOMCAT_USERNAME:$TOMCAT_PASSWORD https://$SVC_IP/host-manager/text/list
    kubectl exec $POD_NAME -n $NS_NAME -- curl -s -k -u $TOMCAT_USERNAME:$TOMCAT_PASSWORD https://$SVC_IP/manager/text/list
 fi   