{{/* _helpers.tpl */}}

{{- define "cts-backend.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" -}}
{{- end -}}

{{- define "cts-backend.fullname" -}}
{{- if .Values.fullnameOverride -}}
{{- .Values.fullnameOverride | trunc 63 | trimSuffix "-" -}}
{{- else -}}
{{- $name := default .Chart.Name .Values.nameOverride -}}
{{- printf "%s-%s" .Release.Name $name | trunc 63 | trimSuffix "-" -}}
{{- end -}}
{{- end -}}

{{- define "cts-backend.labels" -}}
helm.sh/chart: {{ include "cts-backend.chart" . }}
{{ include "cts-backend.selectorLabels" . }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end -}}

{{- define "cts-backend.chart" -}}
{{- if .Chart.Name -}} {{ .Chart.Name }}-{{ .Chart.Version | replace "+" "_" }} {{- else -}} {{ .Chart.Name }}-{{ .Chart.Version }}{{- end -}}
{{- end -}}

{{- define "cts-backend.selectorLabels" -}}
app.kubernetes.io/name: {{ include "cts-backend.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end -}}

