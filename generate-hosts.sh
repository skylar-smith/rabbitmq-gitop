#!/bin/bash

# Get Minikube IP
MINIKUBE_IP=$(minikube ip)

# Define hostnames to map
HOSTNAMES=("postgres.local" "rabbitmq.local" "neo4j.local" "argocd.local")

# Output the /etc/hosts entries
echo "Add the following entries to your /etc/hosts file:"
for HOSTNAME in "${HOSTNAMES[@]}"; do
  echo "$MINIKUBE_IP $HOSTNAME"
done