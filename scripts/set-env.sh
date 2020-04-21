#!/bin/bash

set +x

export NS_NAME=test
export IMAGE_NAME=bitnami-tomcat9-jdk18-root-war
export IMAGE_VERSION=1.0
export POD_NAME=web
export SVC_NAME=web-service
export TOMCAT_USERNAME=admin
export TOMCAT_PASSWORD=admin
export TOMCAT_PORT=8080
export WAIT_TIMEOUT=60

export K8S_DIR=../k8s
