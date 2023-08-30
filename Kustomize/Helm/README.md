Beim Aufruf brauchts die Option --enbable-helm

kubectl kustomize --enable-helm
kustomize --enable-helm

Das Problem mit `kubectl apply -k` ist, dass --enable-helm nicht übergeben werden kann:

Also:

~~~
kubectl kustomize --enable-helm   | kubectl apply -f  -
~~~

Problem bei diesem Aufruf ist nur, das es reines Templating ist.
Wir also mit helm ls nichts sehen

