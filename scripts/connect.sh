#!/bin/bash

. ./set-env.sh

kubectl exec -it $POD_NAME -n $NS_NAME /bin/bash
