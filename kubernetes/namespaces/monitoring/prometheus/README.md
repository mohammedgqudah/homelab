# Prometheus
Prometheus is the time series database used for monitoring the cluster and its services.

## Setup
The configuration file is `prometheus.yml` and can be applied as a configmap using
```
$ make config
```
To reload the configuration, send a SIGHUP signal to the process:
```
kubectl exec --tty --stdin deploy/prometheus -- kill -SIGHUP 1
```
