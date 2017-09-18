# osdockerfile

Build the container image from a Dockerfile
and deploy into OpenShift.

```oc new-project dockerbuild```

```cat Dockerfile | oc new-build --strategy=docker --dockerfile=-  --to=myapp```

```oc new-app myapp```

Or even easier except does not add the Dockerfile contents into the build configuration. I also found this approach
cause certain lines in the Dockerfile to be skipped due to caching (bug?).

```oc new-app .```

## Docker build
```
sudo docker build --rm --force-rm --tag centos7-rngd:latest .
docker run --name centos7-rngd -d centos7-rngd
docker exec -it centos7-rngd bash
bash-4.2# rngd --random-device=/dev/random --rng-device=/dev/urandom
```
