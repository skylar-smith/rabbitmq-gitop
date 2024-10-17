# Trains project infrastructure


## Minikube setup
```bash
./minikube-setup.sh
```

## ArgoCD
```bash
cd argocd-minikube
./setup.sh
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

## Neo4j
Add Neo4j Helm Repo
```bash
helm repo add neo4j https://helm.neo4j.com/neo4j
helm repo update
```

helm install
```
helm install train-neo4j neo4j/neo4j \
  --namespace infrastructure \
  --set neo4jPassword=yourpassword \
  --set acceptLicenseAgreement=yes
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



# Data

(data.gov Class 1 rail roads)[https://geodata.bts.gov/datasets/usdot::north-american-rail-network-lines-class-i-freight-railroads-view/about]