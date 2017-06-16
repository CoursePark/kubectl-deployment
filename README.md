# kubectl-deployment

## Environment Variables

### Kubectl configuration file

kubectl needs configuration file to connect kubernetes cluster. configuration file is taring and base64 encoding as bellow.

`KUBECTL_CONFIG=`

```
cat $HOME/.kube/config | gzip | base64 | pbcopy
```

### Deployment file

This is the cluster deployment file which is taring and base64 encoding 

`DEPLOYMENT_FILE=`

```
cat kubernetes/bluedrop-q-deployment.yml | gzip | base64
```

## Codeship Usage:

Append an encoded environment variable value to the environment variable name with` =`. For an example `DEPLOYMENT_FILE=BASE64_ENCODED_VALUE_SEE_INSTRUCTIONS_ABOVE`. Copy the whole key value pair as a string and use the following to encrypt it.

```
pbpaste > raw.tmp && jet encrypt raw.tmp crypt.tmp && cat crypt.tmp | pbcopy && rm raw.tmp crypt.tmp
```

The value can now be added an array item to a `encrypted_environment` in `codeship-services.yml`.
