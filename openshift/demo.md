# Demo of OpenShift

## Demo of Blue/Green Deployment

Blue/Green deployment demo is based on this
[blog](https://blog.openshift.com/openshift-3-demo-part-10-blue-green-deployments)
post.

* Create PHP sample app _blue_ from the console using the git repo
  [container-demos](https://github.com/hferentschik/container-demos.git)
 * repo URL : https://github.com/hferentschik/container-demos.git
 * context  : openshift/bluegreen
 * no route
* Demo created service
* Create route
 * `oc expose service blue --name=bluegreen --hostname=bluegreen.10.1.2.2.xip.io`
* Make change to code
* Create sample app _green_
* Change the route
 * `oc edit route/bluegreen`

## Demo of application auto scaling

Autoscaling demo is based on this [blog](https://blog.openshift.com/openshift-3-1-pod-autoscaling/).

Demo:

* Prepare config
 * Specify a CPU request
* Create scaler
 * `oc autoscale dc/green --min 1 --max 10 --cpu-percent=5`
 * `oc get hpa`
* `ab -r -n 1000000 -c 10 http://bluegreen.10.1.2.2.xip.io/`

CPU request YAML:

    spec:
      containers:
        ...
        resources:
          requests:
            cpu: 400m

See also:

* https://docs.openshift.org/latest/dev_guide/pod_autoscaling.html
* https://github.com/openshift/origin/issues/6239#issuecomment-163672887

## Demo pushing plain Docker images

Work in progress...
