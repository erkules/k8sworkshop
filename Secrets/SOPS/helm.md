#  Intallation

~~~
helm plugin install https://github.com/jkroepke/helm-secrets
~~~

Verschlüsselt die values.yaml

Wir gehen davon aus, dass es in .sops.yaml konfiguriert ist

~~~
helm secrets enc values.yaml
~~~

Schlüssel der Wahl

~~~
helm secrets upgrade --install -f values.yaml ..
~~~

