#!/bin/bash

. ./set-env.sh

if [ ! -z "$1" ]
then
    kubectl exec -it $1 -n $NS_NAME /bin/bash
fi