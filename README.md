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
get argo pw for cli
```bash
kubectl get secret argocd-initial-admin-secret -n argocd -o jsonpath="{.data.password}" | base64 --decode; echo
```

Cert setup
```bash
openssl req -x509 -nodes -days 365 -newkey rsa:2048 -keyout tls.key -out tls.crt -subj "/CN=argocd.local/O=argocd.local"
kubectl create secret tls argocd-tls --key tls.key --cert tls.crt -n argocd
k apply -f argocd-minikube/argocd-config.yaml
k scale  deployment/argocd-server --replicas=0 && k scale deployment/argocd-server --replicas=1
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