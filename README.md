# osdockerfile

Build the container image from a Dockerfile
and deploy into OpenShift.

```oc new-project dockerbuild```

```cat Dockerfile | oc new-build --strategy=docker --dockerfile=-  --to=myapp```

```oc new-app myapp```

Or even easier except does not add the Dockerfile contents into the build configuration. I also found this approach
cause certain lines in the Dockerfile to be skipped due to caching (bug?).

```oc new-app .```

