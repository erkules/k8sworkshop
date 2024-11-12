~~~
docker container run -v .:/srv -w /srv -v ./config.yaml:/etc/falco-talon/config.yaml  issif/falco-talon:0.2.0-rc1    check -r rules.yaml
~~~

