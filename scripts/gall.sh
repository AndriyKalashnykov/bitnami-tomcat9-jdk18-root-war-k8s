#!/bin/bash

. ./set-env.sh

kubectl get pod -w -n $NS

kubectl get svc -w -n $NS