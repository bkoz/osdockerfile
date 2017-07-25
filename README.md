# osdockerfile

Build the container image from a Dockerfile.

```
cat Dockerfile | oc new-build --strategy=docker --dockerfile=-  --to=myapp
oc new-app myapp
```
