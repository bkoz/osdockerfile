# osdockerfile

Build the container image from a Dockerfile
and deploy into OpenShift.

```
oc new-app https://github.com/bkoz/osdockerfile
oc logs -f bc/osdockerfile
```
  
Another approach.

```cat Dockerfile | oc new-build --strategy=docker --dockerfile=-  --to=myapp```

```oc new-app myapp```

