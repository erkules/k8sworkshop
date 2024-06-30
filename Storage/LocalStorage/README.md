Wir gehen davon aus, dass auf einem Knoten ein Dir erstellt wurde

~~~
mkdir /data/volumes/pv1
chmod 777 /data/volumes/pv1
~~~

Dann erfolgt eine explizite PV
* Hier ist darauf zu achten, dass die PV via NodeSelector/Affinity an einen Knoten gebunden ist
* Dieser sollte in der Vorlage (`pv.yaml`) angepasst werden
und dann Storageclass
