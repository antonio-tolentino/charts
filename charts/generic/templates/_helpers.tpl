{{/*
Expand the name of the chart.
*/}}
{{- define "generic.name" -}}
{{- printf "%s" .Release.Name | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Create a default fully qualified app name.
We truncate at 63 chars because some Kubernetes name fields are limited to this (by the DNS naming spec).
If release name contains chart name it will be used as a full name.
*/}}
{{- define "generic.fullname" -}}
{{- printf "%s" .Release.Name | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Create chart name and version as used by the chart label.
*/}}
{{- define "generic.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Common labels
*/}}
{{- define "generic.labels" -}}
helm.sh/chart: {{ include "generic.chart" . }}
{{ include "generic.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Values.image.tag | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}

{{/*
Selector labels
*/}}
{{- define "generic.selectorLabels" -}}
app.kubernetes.io/name: {{ include "generic.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}

{{/*
Istio labels
*/}}
{{- define "generic.istioLabels" -}}
{{- if .Values.istio.enabled }}
app: {{ .Release.Name }}
version: {{ .Values.image.tag | quote }}
sidecar.istio.io/inject: "true"
{{- end }}
{{- end }}


{{/*
DataDog environment.
*/}}
{{- define "generic.dataDogEnv" -}}
{{- printf  "%s-%s" .Values.dataDog.envName .Values.dataDog.dataDogUniqueID }}
{{- end }}

{{/*
DataDog service.
*/}}
{{- define "generic.dataDogService" -}}
{{- printf  "%s-%s" (include "generic.fullname" .) .Values.dataDog.dataDogUniqueID }}
{{- end }}

{{/*
DataDog labels
*/}}
{{- define "generic.dataDogLabels" -}}
tags.datadoghq.com/env: {{ include "generic.dataDogEnv" . }}
tags.datadoghq.com/service: {{ include "generic.dataDogService" . }}
tags.datadoghq.com/version: {{ .Values.image.tag }}
{{- end }}

{{/*
DataDog variables
*/}}
{{- define "generic.dataDogVar" -}}
{{- with .Values.dataDog.podEnvironment }}
{{- toYaml . }}
{{- end }}
{{- end }}


{{/*
Create the name of the service account to use
*/}}
{{- define "generic.serviceAccountName" -}}
{{- if .Values.serviceAccount.create }}
{{- default (include "generic.fullname" .) .Values.serviceAccount.name }}
{{- else }}
{{- default "default" .Values.serviceAccount.name }}
{{- end }}
{{- end }}

{{/*
Create Cluster FQDN Service name
*/}}
{{- define "generic.serviceClusterFQDN" -}}
{{- printf "%s.%s.svc.cluster.local" (include "generic.fullname" .) .Release.Namespace }}
{{- end }}