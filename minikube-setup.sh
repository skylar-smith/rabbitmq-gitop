minikube stop
minikube config set cpus 6
minikube config set memory 12288
minikube config set disk-size 60g
minikube delete
minikube start
minikube addons enable ingress
minikube addons enable metrics-server