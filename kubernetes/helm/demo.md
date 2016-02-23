# Demo of Kuberentes/Helm

The aim of the demo is to show how seemlessly Kubernetes and
Openshift integrate. In this case by usig [Helm](https://github.com/helm/helm).

### Prerequesite

    # install Helm
    $ curl -s https://get.helm.sh | bash

### Demo

    # Logging into OpenShift creates a active context in the kubeconfig
    # Kubernetes commands issued via Helm will use the same context
    $ oc login https://10.1.2.2:8443
    $ oc new-project helm

    # Show a bit of Helm functionality
    $ ./helm update
    $ ./helm search nginx
    $ ./helm info example-nginx

    # Install example-nginx for demo purposes
    $ ./helm install example-nginx

    # Now use OpenShift to modify the example
    # Start by exploring the helm project in the console
    # There is no service yet, let's add one
    $ oc expose service example-nginx --hostname=nginx.10.1.2.2.xip.io

    # Show http://nginx.10.1.2.2.xip.io/ exposed now
    # Edit the deployment config in the console and change repo to https://github.com/hferentschik/basic-site
    # Restart pods either via console or via
    $ oc scale rc/example-nginx --replicas=0
    $ oc scale rc/example-nginx --replicas=1

    # TODO - continue with changing the image of git-sync, because it is buggy
