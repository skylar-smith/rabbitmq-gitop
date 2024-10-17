
# need to adjust this use argo core instead. Then provide instructions for running ui in local.
# https://argo-cd.readthedocs.io/en/stable/operator-manual/core/#installing
kubectl create namespace argocd
kubectl apply -n argocd -f https://raw.githubusercontent.com/argoproj/argo-cd/stable/manifests/install.yaml
kubectl apply -f ingress.yaml