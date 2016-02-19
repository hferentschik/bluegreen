#!/usr/bin/env bash

# Configure metrics
#
# sudo visudo
# Defaults    env_keep += "KUBECONFIG"
#
# https://github.com/openshift/origin-metrics
# https://docs.openshift.com/enterprise/latest/install_config/cluster_metrics.html#configuring-openshift-metrics

export KUBECONFIG=/var/lib/origin/openshift.local.config/master/admin.kubeconfig

sudo oc project openshift-infra
sudo oc create -f - <<API
  apiVersion: v1
  kind: ServiceAccount
  metadata:
    name: metrics-deployer
  secrets:
  - name: metrics-deployer
API

sudo oadm policy add-role-to-user edit system:serviceaccount:openshift-infra:metrics-deployer
sudo oadm policy add-cluster-role-to-user cluster-reader system:serviceaccount:openshift-infra:heapster

sudo oc secrets new metrics-deployer nothing=/dev/null
sudo oc process -f https://raw.githubusercontent.com/openshift/origin-metrics/master/metrics.yaml \
  -v HAWKULAR_METRICS_HOSTNAME=hawkular-metrics.cdk.10.1.2.2.xip.io,USE_PERSISTENT_STORAGE=false,MASTER_URL=https://10.0.2.15:8443 \
  | sudo oc create -f -

# edit /var/lib/origin/openshift.local.config/master/master-config.yaml
# metricsPublicURL: https://hawkular-metrics.cdk.10.1.2.2.xip.io/hawkular/metrics

sudo sed -i.orig \
-e "/assetConfig:/a\ \ metricsPublicURL: https://hawkular-metrics.cdk.10.1.2.2.xip.io/hawkular/metrics" \
/var/lib/origin/openshift.local.config/master/master-config.yaml
