# Trains project infrastructure


## Minikube setup
```bash
minikube start --cpus=4 --memory=8192 --disk-size=50g
minikube addons enable ingress
minikube addons enable metrics-server
```

## Infrastructure

```bash
kubectl create namespace infrastructure
```

## Rabbitmq deploy
```bash
helm install trains-rabbitmq bitnami/rabbitmq \
  --namespace infrastructure \
  --set auth.username=bugs \
  --set auth.password=bunny
```

## PostgresSQL
```bashrc
helm install trains-postgres bitnami/postgresql \
  --namespace infrastructure \
  --set global.postgresql.auth.username=horton\
  --set global.postgresql.auth.password=seuss \
  --set global.postgresql.auth.database=traindb
```


## Ingress setup
get the minikube ip
```bash
minikube ip
```

update `/etc/hosts`
```bash
<MINIKUBE_IP>  postgres.local
<MINIKUBE_IP>  rabbitmq.local
```