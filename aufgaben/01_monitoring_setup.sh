#!/bin/bash
echo "=== Monitoring-Stack installieren ==="

echo "--- Schritt 1: Metrics Server (Voraussetzung für HPA) ---"
minikube addons enable metrics-server

echo ""
echo "--- Schritt 2: Prometheus + Grafana via Helm ---"
helm repo add prometheus-community \
  https://prometheus-community.github.io/helm-charts
helm repo update

# TODO: Installiere den kube-prometheus-stack
# helm install monitoring prometheus-community/kube-prometheus-stack \
#   --namespace monitoring \
#   --create-namespace \
#   --set grafana.adminPassword=novatech-admin

echo ""
echo "--- Schritt 3: Pods prüfen ---"
kubectl get pods -n monitoring

echo ""
echo "--- Schritt 4: Grafana aufrufen ---"
echo "kubectl port-forward svc/monitoring-grafana 3000:80 -n monitoring"
echo "Browser: http://localhost:3000 (admin / novatech-admin)"

echo ""
echo "=== Aufgaben ==="
echo "1. Welche Dashboards sind vorinstalliert?"
echo "2. Finde: CPU-Auslastung pro Node, Pod-Anzahl pro Namespace"
echo "3. Öffne Prometheus: kubectl port-forward svc/monitoring-kube-prometheus-prometheus 9090:9090 -n monitoring"
echo "4. PromQL testen: container_cpu_usage_seconds_total{namespace='novatech-dev'}"
