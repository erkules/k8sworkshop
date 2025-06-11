# Kustomize und Sops

Key erstellen:

~~~
age-keygen -o key.txt
~~~

Erstelle eine (gerne hier lokal im Verzeichnis) `.sops.yaml`

Damit weiß sops was für eine Ver-Schlüssel-ung genommen werden soll.

Erspart uns Commandlineoptions :)

-----

Ok jetze mal ksops: siehe secret-generator.yaml
Der wird nachher von kustomize aufgerufen (ja echt nervig)
Und das verschlüsselte Secret ist hier (und nicht in der kustomization)

Später wird in der kustomization obiges secret-generator.yaml als plugin aufgerufen

