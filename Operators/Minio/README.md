# Minio Operator


~~~
kubectl apply -k "github.com/minio/operator?ref=v6.0.3"
kubectl -n minio-operator get pods
~~~

Tenants also Minio-Instanzen werden über entsprechende
CRDs erstellt. Siehe tenant.yaml



Da ists.

TODO: 

Image mit mc (minoclient) bauen oda:

~~~
curl https://dl.min.io/client/mc/release/linux-amd64/mc \
   --create-dirs \
   -o $HOME/minio-binaries/mc
chmod +x $HOME/minio-binaries/mc
export PATH=$PATH:$HOME/minio-binaries/
mc --help
~~~

Ich nenne mc gerne minio-client weil mc ist midnight commander


# Console

~~~
kubectl -n minio-tenant port-forward svc/myminio-console 9443 
~~~

user: minio
password: minio123
	
Also 

~~~
set +o history
minio-client alias set s3 http://localhost:9443 minio minio123
set -o history
~~~
	
