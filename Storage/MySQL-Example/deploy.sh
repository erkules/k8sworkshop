kubectl apply -f mysqld-pvc.yaml
kubectl apply -f mysqld-deploy.yaml
kubectl wait --for=condition=ready deploy mysqld
kubectl apply -f mysqld-svc.yaml
kubectl apply -f mysql-client-deploy.yaml
kubectl apply -f mysql-client-ing.yaml
kubectl apply -f mysql-client-svc.yaml
kubectl apply -f mysqld-load-data.yaml

