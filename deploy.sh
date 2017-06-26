#!/bin/sh

export KUBECTL_PATH=$HOME/.kube
mkdir -p $KUBECTL_PATH

# extract kubectl config from KUBECTL_CONFIG and create configure
if [ ! -z "$KUBECTL_CONFIG" ]; then
echo $KUBECTL_CONFIG | base64 -d | gzip -d > $KUBECTL_PATH/config
fi

# extract bluedrop-q-deployment.yml from DEPLOYMENT_FILE
if [ ! -z "$DEPLOYMENT_FILE" ]; then
echo $DEPLOYMENT_FILE | base64 -d | gzip -d > bluedrop-q-deployment.yml
fi

sed -ie "s/THIS_STRING_IS_REPLACED_DURING_BUILD/$(echo ${CI_COMMIT_ID})/g" bluedrop-q-deployment.yml

echo "Starting kubernetes deployment"
echo "Running kubectl apply -f bluedrop-q-deployment.yml"
kubectl apply -f bluedrop-q-deployment.yml --record
echo "Finished kubernetes deployment"
