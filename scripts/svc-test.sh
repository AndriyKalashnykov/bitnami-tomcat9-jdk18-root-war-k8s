#!/bin/bash

set -x

. ./set-env.sh

kubectl get svc $SVC_NAME -n $NS_NAME -w

kubectl get svc $SVC_NAME -n $NS_NAME --no-headers | awk '{print $4}' | xargs -I {} sh -c 'echo https://{}/; curl --insecure https://{}/index.html'

