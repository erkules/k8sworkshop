kubectl create ns db
kubectl -n db apply -f mysqld-pvc.yaml
kubectl -n db apply -f mysqld-deploy.yaml
kubectl -n db wait --for=condition=ready deploy mysqld
kubectl -n db apply -f mysqld-svc.yaml
kubectl -n db apply -f mysql-client-deploy.yaml
kubectl -n db apply -f mysql-client-ing.yaml
kubectl -n db apply -f mysql-client-svc.yaml
kubectl -n db apply -f mysqld-load-data.yaml

