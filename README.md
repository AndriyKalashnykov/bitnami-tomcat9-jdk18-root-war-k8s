[![License](https://img.shields.io/hexpm/l/plug.svg?maxAge=2592000)]()

# Deploy Customized Bitnami Tomcat Docker Image + ROOT.war + Tomcat 9 on Kubernetes

Deploy Java Web Appplication:
 - Tomcat 9
 - Use HTTP/2 adapter for protocol upgrade - requires Apache APR
 - JDK 1.8
 - deploy WAR at a root "/" context
  
### Create namespace

```shell
cd scripts
. ./set-evn.sh
kubectl create ns $NS_NAME
```

### Create PVC

```shell
cd scripts
. ./set-evn.sh
kubectl create -f $K8S_DIR/pvc.yaml -n $NS_NAME
```

### Deploy bitnami-tomcat9-debian-10-r13

[bitnami-docker-tomcat](https://github.com/bitnami/bitnami-docker-tomcat)

[bitnami/tomcat:9.0.34-debian-10-r13](https://hub.docker.com/layers/bitnami/tomcat/9.0.34-debian-10-r13/images/sha256-0cf36570af15c6b4224fdc3c66ee5b42bfcf1a670dd3823ecf9173b389b3288b?context=explore)

I've customized Bitami docker image a bit to incorporate few changes:

[bitnami-tomcat9-jdk18](https://hub.docker.com/r/andriykalashnykov/bitnami-tomcat9-jdk18)

and then created another docker image to demonstrate how deploy WAR file as ROOT
"/" context

[bitnami-tomcat9-jdk18-root-war](https://hub.docker.com/r/andriykalashnykov/bitnami-tomcat9-jdk18-root-war)

```shell
cd scripts
./deploy.sh bitnami-tomcat9-debian-10-r13
```

### Test bitnami-tomcat9-debian-10-r13

```shell
cd scripts
./test.sh bitnami-tomcat9-debian-10-r13
```

### Get a shell to the running Container bitnami-tomcat9-debian-10-r13

```shell
cd scripts
./connect.sh bitnami-tomcat9-debian-10-r13

$ curl http://localhost:8080/
$ curl -u admin:admin http://localhost:8080/host-manager/text/list
```

### Deploy hello-world-webapp via Tomcat UI

Upload ../apps/hellow-world-webapp.war

### UnDeploy bitnami-tomcat9-debian-10-r13

```shell
cd scripts
./undeploy.sh bitnami-tomcat9-debian-10-r13
```

---

### Deploy bitnami-tomcat9-jdk18-root-war

```shell
cd scripts
./deploy.sh bitnami-tomcat9-jdk18-root-war
```

### Test bitnami-tomcat9-jdk18-root-war

```shell
cd scripts
./test.sh bitnami-tomcat9-jdk18-root-war
```

### Get a shell to the running Container bitnami-tomcat9-jdk18-root-war

```shell
cd scripts
./connect.sh bitnami-tomcat9-jdk18-root-war

$ curl http://localhost:8080/index.html
$ curl -k https://localhost:8443/index.html
$ curl -k -u admin:admin https://localhost:8443/manager/status/all?XML=true
$ netstat -a | egrep 'Proto|LISTEN'
$ lsof -i -P 2>/dev/null
```

### Uneploy bitnami-tomcat9-jdk18-root-war

```shell
cd scripts
./undeploy.sh bitnami-tomcat9-jdk18-root-war
```
