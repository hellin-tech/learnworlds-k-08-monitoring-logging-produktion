# K-08: Monitoring, Logging & Produktionsbetrieb

## NovaTech-Szenario
Die Hannover Messe steht in zwei Wochen bevor. Lisa fragt im Readiness-Review: "Wie wissen wir, wenn etwas schiefgeht? Was passiert bei 500 statt 50 Sensoren?" Tom implementiert Monitoring mit Prometheus + Grafana, zentrales Logging und HorizontalPodAutoscaler.

## Lernziele
- Prometheus + Grafana als Monitoring-Stack installieren
- Probes (Liveness, Readiness, Startup) im Produktionskontext optimieren
- HorizontalPodAutoscaler für lastbasierte Skalierung konfigurieren
- Zentrales Logging mit Fluent Bit verstehen

## Voraussetzungen

- GitHub-Konto
- Zugriff auf GitHub Codespaces
- Grundlegende Kenntnisse im Umgang mit dem Terminal

Docker, kubectl, minikube und Helm werden automatisch
in der Cloud-Entwicklungsumgebung bereitgestellt.
Eine lokale Installation ist nicht notwendig.

### Entwicklungsumgebung starten

1. Öffne das Repository auf GitHub
2. Klicke auf **Code** → **Codespaces** → **Create codespace on main**
3. Die Entwicklungsumgebung wird automatisch vorbereitet. Der erste Start und das Einrichten des Kubernetes-Clusters können einige Minuten dauern.


## Aufgaben

### Aufgabe 1: Monitoring-Stack installieren
Arbeite `aufgaben/01_monitoring_setup.sh` durch.

### Aufgabe 2: Probes konfigurieren
Erstelle produktionsreife Probe-Konfiguration (`aufgaben/api-probes.yaml`).

### Aufgabe 3: HPA konfigurieren
Erstelle einen HorizontalPodAutoscaler (`aufgaben/api-hpa.yaml`) und teste lastbasierte Skalierung.

### Aufgabe 4: Alerting-Regel
Erstelle eine Prometheus-Alertregel in `aufgaben/alert-rules.yaml`.

## Lösung
Musterlösungen im Ordner `loesung/`.
