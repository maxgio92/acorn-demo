# Quickstart

## Pre-requisites

- Kubernetes cluster with Ingress controller installed

## Create a local KinD cluster with ingress-nginx controller

```shell
make cluster
```

## Build and run a test app


```shell
acorn run -n awesome-acorn ./acorn-test-app
```

with argument:

```shell
acorn run -n awesome-acorn ./acorn-test-app --welcome="Maro' che shfizio"
```

Access the app:

```shell
acorn ps
```

## Development mode


```shell
acorn run -n awesome-acorn --dev ./acorn-test-app
```

## Release

Login into your OCI registry, if needed (interactive):

```shell
acorn login ghcr.io
```

Build the Acorn image and tag it to your liking:

```shell
acorn build -t ghcr.io/acorn-io/getting-started:v0.0.1 ./acorn-test-app
```

Push the newly built Acorn image:

```shell
acorn push ghcr.io/acorn-io/getting-started:v0.0.1
```

## Interact with the app container:

```shell
acorn exec awesome-acorn
```

## Cleanup

```shell
acorn stop awesome-acorn
acorn rm awesome-acorn
```

