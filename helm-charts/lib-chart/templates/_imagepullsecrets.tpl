{{/*
Derive the appropriate imagePullSecrets value (if any).
*/}}
{{- define "common.imagepullsecrets" -}}
{{- if .Values.image.pullSecrets }}
imagePullSecrets:
{{- range .Values.image.pullSecrets }}
    - name: {{ . }}
{{- end }}
{{- else if .Values.global }}
{{- if .Values.global.image.pullSecrets }}
imagePullSecrets:
{{- range .Values.global.image.pullSecrets }}
    - name: {{ . }}
{{- end -}}
{{- end -}}
{{- end -}}
{{- end -}}
