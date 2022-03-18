# Sops

* https://github.com/mozilla/sops
* Irgendwie wie SealedSecrets 
* Ohne Daemon
* Mit Key woanders

# Anders

* sops (ein Client) verschlüsselt -> landet in Git
* Pipeline entschlüsselt -> Secret landet direkt im Etcd

# Wo ist mein Key her

Janz viel:

* GPG
* AWS KMS
* Google KMS
* YaddaYadda


# AWS

Simply

~~~
aws kms create-key  --description "sops example" | grep Arn
~~~

.sops.yaml

~~~
creation_rules:
  - kms: "MY ARN"
~~~


Ruhig eine existierenede Datei nehmen

~~~
sops -e -i datei.yaml
~~~

oder 

~~~
sops -e -i --kms arn:......:  datei.yaml
~~~

Ups kauderwelsch

~~~
sops exec-env file.yaml 'ich-mach-was-mit-env-aus-file.sh'
~~~



# GPG

Deprecated: https://github.com/mozilla/sops/issues/727

https://github.com/FiloSottile/age


~~~
gpg --batch --generate-key <<EOF
%no-protection
Key-Type: default
Subkey-Type: default
Name-Real: Foo Bar
Expire-Date: 0
EOF
~~~

.sops.yaml
~~~
creation_rules:
  - pgp: <gpg-key>
~~~

~~~
sops geheime-datei.yaml
~~~

oder ohne Config

~~~
pgp --list-keys
sops --pgp FINGERPRINT -e ...
~~~


# AGE

TODO

