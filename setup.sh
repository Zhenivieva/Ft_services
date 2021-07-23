#!/bin/sh
# kubectl delete -f configmap.yaml
# kubectl delete -f nginx/nginx-config.yaml
# kubectl delete -f mysql/mysql-config.yaml
# kubectl delete -f wp/wp-config.yaml
# kubectl delete -f ftps/ftps-config.yaml
# kubectl delete -f phpma/phpma-config.yaml
# kubectl delete -f grafana/grafana-config.yaml
# kubectl delete -f influxdb/influxdb-config.yaml
# # minikube stop
minikube delete
minikube start --vm-driver=virtualbox --memory 4096
minikube addons enable metallb
eval $(minikube docker-env)
kubectl apply -f configmap.yaml
docker build -t nginx-image nginx/.
kubectl apply -f nginx/nginx-config.yaml
docker build -t mysql-image mysql/.
kubectl apply -f mysql/mysql-config.yaml
docker build -t phpma-image phpma/.
kubectl apply -f phpma/phpma-config.yaml
docker build -t wp-image wp/.
kubectl apply -f wp/wp-config.yaml
docker build -t ftps-image ftps/.
kubectl apply -f ftps/ftps-config.yaml
docker build -t grafana-image grafana/.
kubectl apply -f grafana/grafana-config.yaml
docker build -t influxdb-image influxdb/.
kubectl apply -f influxdb/influxdb-config.yaml
kubectl get all
# minikube dashboard
# kubectl exec deploy/influxdb-deployment  -- pkill influxd
# kubectl exec deploy/mysql-deployment  -- pkill mysqld 