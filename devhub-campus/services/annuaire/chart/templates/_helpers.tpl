{{- define "annuaire.name" -}}
{{- .Chart.Name | trunc 63 | trimSuffix "-" }}
{{- end }}

{{- define "annuaire.fullname" -}}
{{- printf "%s-%s" .Release.Name .Chart.Name | trunc 63 | trimSuffix "-" }}
{{- end }}

{{- define "annuaire.selectorLabels" -}}
app.kubernetes.io/name: {{ include "annuaire.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}

{{- define "annuaire.labels" -}}
helm.sh/chart: {{ .Chart.Name }}-{{ .Chart.Version }}
{{ include "annuaire.selectorLabels" . }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
app.kubernetes.io/part-of: devhub-campus
{{- end }}
