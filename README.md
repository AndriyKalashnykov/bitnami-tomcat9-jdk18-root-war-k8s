[![Hits](https://hits.seeyoufarm.com/api/count/incr/badge.svg?url=https%3A%2F%2Fgithub.com%2FAndriyKalashnykov%2Fbitnami-tomcat9-jdk18-root-war-k8s&count_bg=%2379C83D&title_bg=%23555555&icon=&icon_color=%23E7E7E7&title=hits&edge_flat=false)](https://hits.seeyoufarm.com)
[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)
# Deploying Bitnami Tomcat 9 on Kubernetes

Default bitnami-tomcat9-debian-10-r13 image:
 - Tomcat 9 :white_check_mark:
 - HTTP/2 adapter for protocol upgrade - requires Apache APR :white_check_mark:
 - JDK 1.8 :x:
 - WAR deployed as a root "/" :x:
  

### Deploy bitnami-tomcat9-debian-10-r13

GitHub repo: [bitnami-docker-tomcat](https://github.com/bitnami/bitnami-docker-tomcat)

DockerHub image: [bitnami/tomcat:9.0.34-debian-10-r13](https://hub.docker.com/layers/bitnami/tomcat/9.0.34-debian-10-r13/images/sha256-0cf36570af15c6b4224fdc3c66ee5b42bfcf1a670dd3823ecf9173b389b3288b?context=explore)


#### Create namespace

```bash
cd scripts
. ./set-evn.sh
kubectl create ns $NS
```

#### Create PVC

```bash
cd scripts
. ./set-evn.sh
kubectl create -f $K8S_DIR/pvc.yaml -n $NS
```

### Deploy bitnami-tomcat9-debian-10-r13

```bash
cd scripts
./deploy.sh bitnami-tomcat9-debian-10-r13
```

### Test bitnami-tomcat9-debian-10-r13

```bash
cd scripts
./test.sh bitnami-tomcat9-debian-10-r13
```

### Get a shell to the running container

```bash
cd scripts
./connect.sh bitnami-tomcat9-debian-10-r13

$ curl http://localhost:8080/
$ curl -u admin:admin http://localhost:8080/host-manager/text/list
```

### Deploy hello-world-webapp via Tomcat UI

Upload [../apps/hellow-world-webapp.war](https://github.com/AndriyKalashnykov/bitnami-tomcat9-jdk18-root-war-k8s/blob/cb70dfb18ea69ee66177326d090e5eed461dc0aa/apps/hellow-world-webapp.war) via Web UI

### UnDeploy bitnami-tomcat9-debian-10-r13

```bash
cd scripts
./undeploy.sh bitnami-tomcat9-debian-10-r13
```

## Customized  andriykalashnykov/bitnami-tomcat9-jdk18 image:

I've customized Bitami docker image `bitnami-tomcat9-jdk18` a bit to incorporate missing requiremets and few enhancement: [andriykalashnykov/bitnami-tomcat9-jdk18](https://hub.docker.com/r/andriykalashnykov/bitnami-tomcat9-jdk18)

 - Tomcat 9 :white_check_mark:
 - HTTP/2 adapter for protocol upgrade - requires Apache APR :white_check_mark:
 - JDK 1.8 :white_check_mark:
 - WAR deployed as a root "/" :white_check_mark:

and created another image to demonstrate how deploy WAR file as ROOT "/" context [andriykalashnykov/bitnami-tomcat9-jdk18-root-war](https://hub.docker.com/r/andriykalashnykov/bitnami-tomcat9-jdk18-root-war)

### Deploy andriykalashnykov/bitnami-tomcat9-jdk18-root-war

```bash
cd scripts
./deploy.sh bitnami-tomcat9-jdk18-root-war
```

### Test andriykalashnykov/bitnami-tomcat9-jdk18-root-war

```bash
cd scripts
./test.sh bitnami-tomcat9-jdk18-root-war
```

### Get a shell to the running Container andriykalashnykov/bitnami-tomcat9-jdk18-root-war

```bash
cd scripts
./connect.sh bitnami-tomcat9-jdk18-root-war

$ curl http://localhost:8080/index.html
$ curl -k https://localhost:8443/index.html
$ curl -k -u admin:admin https://localhost:8443/manager/status/all?XML=true
$ netstat -a | egrep 'Proto|LISTEN'
$ lsof -i -P 2>/dev/null
```

### Uneploy andriykalashnykov/bitnami-tomcat9-jdk18-root-war

```bash
cd scripts
./undeploy.sh bitnami-tomcat9-jdk18-root-war
```

[deployment scripts]: https://github.com/AndriyKalashnykov/bitnami-tomcat9-jdk18-root-war-k8s/tree/master/scripts