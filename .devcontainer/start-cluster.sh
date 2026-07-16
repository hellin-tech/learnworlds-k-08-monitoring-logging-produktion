#!/usr/bin/env bash
set -euo pipefail

echo "=== NovaTech Lab K-08: Umgebung wird vorbereitet ==="

echo "Prüfe Docker ..."
docker info >/dev/null 2>&1 || { echo "Docker ist nicht verfügbar."; exit 1; }

echo "Prüfe Kubernetes-Cluster ..."
if ! minikube status >/dev/null 2>&1; then
  echo "Starte minikube-Cluster ..."
  minikube start \
    --driver=docker \
    --cpus=3 \
    --memory=5120
fi

echo "Warte auf Ready-Status aller Nodes ..."
kubectl wait \
  --for=condition=Ready \
  nodes \
  --all \
  --timeout=180s

echo "Stelle Ausgangs-Deployments und Services bereit ..."
kubectl apply -f setup/

echo "Aktiviere Metrics Server ..."
minikube addons enable metrics-server

echo "Warte auf Metrics Server ..."

kubectl rollout status \
  deployment/metrics-server \
  -n kube-system \
  --timeout=180s

echo "Warte auf Deployment-Bereitschaft ..."
kubectl wait \
  --for=condition=Available \
  deployment/novatech-api \
  -n novatech-dev \
  --timeout=120s

echo ""
echo "=== Kubernetes-Cluster und Basis-Deployments sind bereit ==="
echo ""
echo "Hinweis: Nach dem Start von Grafana/Prometheus den Port-Forward"
echo "einrichten und im VS Code Ports-Panel auf das Globus-Symbol klicken."
echo ""
kubectl get all -n novatech-dev
