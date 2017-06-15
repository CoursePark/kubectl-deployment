#!/bin/sh

export KUBECTL_PATH=$HOME/.kube
mkdir -p $KUBECTL_PATH

# extract kubectl config from KUBECTL_CONFIG and create configure
if [ ! -z "$KUBECTL_CONFIG" ]; then
echo $KUBECTL_CONFIG | base64 -d | gzip -d > $KUBECTL_PATH/config
fi

echo "Starting kubernetes deployment"
echo "Running kubectl set image $DEPLOYMENT $SET_CONTAINER_IMAGE --record"
kubectl set image $DEPLOYMENT $SET_CONTAINER_IMAGE --record
echo "Finished kubernetes deployment"
