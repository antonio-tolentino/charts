# Attools

This document describe how to install attools pocket knife container.

## Requirements

* Kubernetes 1.9 or newer cluster with RBAC (Role-Based Access Control) enabled is required.
* Helm 2.11.0
* Kubectl client installed and configured to access Kubernetes Cluster.

## Configuration

The Helm chart ships with reasonable defaults. There may be circumstances in which defaults require overrides. To
override Helm values, use --set key=value argument during the helm install command. Multiple --set
operations may be used in the same Helm operation. The currently exposed options are explained inthe following table:

| Parameter | Description | Values | Default | Optional
| --- | --- | --- | --- |--- |
| `image` | Specifies Attools image name | Registry image name defined   | `attools` | No |
| `imagePullPolicy` | Specifies Attools image pull Policy | Always/Never/IfNotPresent   | `Always` | No |

In order to create Attools namespace during installation, use `--namespace` option. If this option is not informed Attools will be installed in current namespace.

## Installating Chart examples

```bash
helm upgrade --install attools \
--create-namespace=true \
--namespace=attools 
```
