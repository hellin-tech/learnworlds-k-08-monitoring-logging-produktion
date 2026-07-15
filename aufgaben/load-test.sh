#!/bin/bash
echo "=== Lasttest für HPA ==="

echo "--- HPA Status beobachten (in separatem Terminal) ---"
echo "kubectl get hpa -n novatech-dev -w"

echo ""
echo "--- Künstliche Last erzeugen ---"
# Starte einen Pod, der den API-Server mit Requests flutet
kubectl run load-test --image=busybox:1.36 -n novatech-dev --restart=Never -- \
  /bin/sh -c "while true; do wget -q -O- http://api-service; done"

echo ""
echo "Beobachte den HPA: Die CPU steigt, Pods werden automatisch hinzugefügt."
echo "Stoppe den Lasttest mit: kubectl delete pod load-test -n novatech-dev"
echo "Beobachte den Scale-Down (dauert ca. 5 Minuten)."
