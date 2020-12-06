# Helm chart usage
## Pre-requisites
Helm 3.4 CLI tool installed.
These charts support specifiying an imagePullSecret for images being pulled from a private repo, however, the secret must be created in the namespace before installing the charts, e.g.  

```bash
kubectl create secret docker-registry gcr-access --docker-server=eu.gcr.io --docker-username=_json_key --docker-password="$(cat /path/to/keyfile.json)" --docker-email=email@example.com
```

Then in the values.yaml declare the imagePullSecrets value:

```yaml
global:
  image:
    pullSecrets:
    - gcr-access
```

> **_NOTE:_**  By default the Redis image is pulled from marketplace.gcr.io so TWO docker-registry secrets are necessary.
