#!/bin/bash

set +x

export NS_NAME=scdc1-staging-solution-builder
export IMAGE_NAME=bitnami-tomcat9-jdk18-root-war
export IMAGE_VERSION=1.0
export POD_NAME=bitnami-tomcat9-jdk18-root-war
export SVC_NAME=web-svc
export TOMCAT_USERNAME=admin
export TOMCAT_PASSWORD=admin
export WAIT_TIMEOUT=60

export K8S_DIR=../k8s
export TOMCAT_CONF=../tomcat/conf
