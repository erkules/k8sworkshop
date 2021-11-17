ansiblecontroller/roles/ihateansible/tasks/main.yml
Hier kommt ein Deployment rein. Im Deployment sollte replicas mit `.Values.size` konfiguriert werden.

Wir setzen den Default:

echo "size: 2" >> ansiblecontroller/roles/ihateansible/defaults/main.yaml


Hier wird unsere CRD definiert. Es sollte auch size können :)

ansiblecontroller/config/samples/apps_v1alpha1_ihateansible.yaml anpassen
