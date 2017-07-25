# osdockerfile

Build the container image from a Dockerfile
and deploy into OpenShift.

```cat Dockerfile | oc new-build --strategy=docker --dockerfile=-  --to=myapp```

```oc new-app myapp```
