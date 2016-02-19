# Demo of OpenShift

## Demo of Blue/Green Deployment

Demo based on this [blog](https://blog.openshift.com/openshift-3-demo-part-10-blue-green-deployments)
post.

* Create PHP sample app from the console using the git repo
  [container-demos](https://github.com/hferentschik/container-demos.git)
 * repo URL : https://github.com/hferentschik/container-demos.git
 * context  : openshift/bluegreen
 * no route
* Demo created service
* Create route
 * `oc expose service blue --hostname=bluegreen.10.1.2.2.xip.io`
* Make change to code


## Demo of application auto scaling

Work in progress...

## Demo pushing plain Docker images

Work in progress...
