#!/bin/bash

. ./set-env.sh

kubectl get pod -w -n $NS_NAME

kubectl get svc -w -n $NS_NAME