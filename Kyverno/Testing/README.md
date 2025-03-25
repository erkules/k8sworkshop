# Install 

Easy peasy

~~~
kubectl krew install kyverno
~~~

or

~~~
curl -LO https://github.com/kyverno/kyverno/releases/download/v1.12.0/kyverno-cli_v1.12.0_linux_x86_64.tar.gz
tar -xvf kyverno-cli_v1.12.0_linux_x86_64.tar.gz
sudo cp kyverno /usr/local/bin/
~~~

# Testing Dry-Run 

~~~
kubectl kyverno apply ../policy_validate_pod_label.yaml --resource ../../Pods/pod.yaml
~~~


# Testing

* mit einer eigenen Policy checken
* pass/skip/fail/warn

