# osdockerfile

Build the container image from a Dockerfile
and deploy into OpenShift.

```oc new-project dockerbuild```

```cat Dockerfile | oc new-build --strategy=docker --dockerfile=-  --to=myapp```

```oc new-app myapp```

Or even easier...

```oc new-app .```

