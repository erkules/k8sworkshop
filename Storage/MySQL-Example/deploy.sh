kubectl apply -f mysqld-pvc.yml
kubectl apply -f mysqld-deploy.yml
kubectl wait --for=condition=ready deploy mysqld
kubectl apply -f mysqld-svc.yaml
kubectl apply -f mysql-client-deploy.yml
kubectl apply -f mysql-client-ing.yml
kubectl apply -f mysql-client-svc.yml
kubectl apply -f mysqld-load-data.yaml

