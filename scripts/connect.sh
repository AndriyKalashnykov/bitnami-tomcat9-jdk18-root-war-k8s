#!/bin/bash

. ./set-env.sh

kubectl exec -it $POD_NAME -n $NS_NAME /bin/bash

# kubectl exec -it tomcat-bitnami-original -n test /bin/bash
