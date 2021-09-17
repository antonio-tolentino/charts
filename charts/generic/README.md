# Generic

This document describe how to use generic helm chart to install any application

## Requirements

* Kubernetes 1.18 or newer cluster with RBAC (Role-Based Access Control) enabled is required.
* Helm 3
* Kubectl client installed and configured to access Kubernetes Cluster.

## Basic Example

```bash
helm upgrade --install <RELEASE-NAME> \
--create-namespace=true \
--namespace=<NAMESPACE> \
--set image.repository=<IMAGE-REPOSITORY> \
--set image.tag=<IMAGE-TAG> \
<REPO-NAME>/generic
```

## NGINX and Let's Encrypt Example

```bash
helm upgrade --install <RELEASE-NAME> \
--create-namespace=true \
--namespace=<NAMESPACE>  \
--set image.repository=<IMAGE-REPOSITORY> \
--set image.tag=<IMAGE-TAG> \
--set ingress.enabled=true \
--set ingress.annotations."cert-manager\.io/cluster-issuer"=letsencrypt-prod \
--set ingress.hosts[0].host=myapp.domain.io \
--set ingress.hosts[0].paths[0]="/" \
--set ingress.tls[0].secretName=domain-tls \
--set ingress.tls[0].hosts[0]=myapp.domain.io \
<REPO-NAME>/generic
```

## Istio Example

```bash
helm upgrade --install <RELEASE-NAME> \
--create-namespace=true \
--namespace=<NAMESPACE> \
--set image.repository=<IMAGE-REPOSITORY> \
--set image.tag=<IMAGE-TAG> \
--set istio.enabled=true \
--set istio.gateway.enabled=true \
--set istio.dnsNames[0]=myapp.domain.io \
--set istio.tls.enabled=true \
--set istio.tls.localCert=true \
--set istio.tls.credentialName=domain-tls \
<REPO-NAME>/generic
```

## Linkedsecrets Azure Example

```bash
helm upgrade --install <RELEASE-NAME> \
--create-namespace=true \
--namespace=<NAMESPACE> \
--set image.repository=<IMAGE-REPOSITORY> \
--set image.tag=<IMAGE-TAG> \
--set linkedsecrets.enabled=true \
--set linkedsecrets.name=apptest-linkedsecrets \
--set linkedsecrets.providerDataFormat=JSON \
--set linkedsecrets.providerOptions."keyvault"=linkedsecret \
--set linkedsecrets.providerOptions."secret"=opaque-secret-json \
--set linkedsecrets.secretName=apptest-kubernetes-secret \
--set linkedsecrets.schedule="@every 5m" \
<REPO-NAME>/generic
```
