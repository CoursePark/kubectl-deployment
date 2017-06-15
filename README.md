# kubectl-deployment

## Environment Variables

### Kubectl configuration file

kubectl needs configuration file to connect kubernetes cluster. configuration file is taring and base64 encoding like bellow.

`KUBECTL_CONFIG=`

```
cat $HOME/.kube/config | gzip | base64 | pbcopy
```

### Deployment

This is the name of the deployment. you can get the deployment name from `kubectl get deployment`

```
DEPLOYMENT=deployment/bluedrop-q
```

### Set an image to container

You can set an image to one or more containers.

```
SET_CONTAINER_IMAGE=<container_name>=<image> 
```
For example:

```
bluedrop-q-client=bluedrop360/bluedrop-q-client:qc bluedrop-q-server=bluedrop360/bluedrop-q-server:qc
```

## Codeship Usage:

Append the environment variable value to the environment variable name with` =`. For an example `DEPLOYMENT=deployment/bluedrop-q`. Copy the whole key value pair as a string and use the following to encrypt it.

```
pbpaste > raw.tmp && jet encrypt raw.tmp crypt.tmp && cat crypt.tmp | pbcopy && rm raw.tmp crypt.tmp
```

The value can now be added an array item to a `encrypted_environment` in `codeship-services.yml`.
