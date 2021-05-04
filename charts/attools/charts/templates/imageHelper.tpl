{{/* Create secret with repository credentials */}}
 
{{- define "imagePullSecret" }}
{{- printf "{\"auths\": {\"%s\": {\"auth\": \"%s\"}}}" .Values.global.imageRegistry (printf "%s:%s" .Values.global.imageRepoUser .Values.global.imageRepoPwd | b64enc) | b64enc }}
{{- end }}
    
    
{{/* 
Create image string with 3 possible formats:
    <REGISTRY-NAME>/<REPOSITORY-NAME>/<IMAGE-NAME>:<TAG>
    <REGISTRY-NAME>/<IMAGE-NAME>:<TAG>
    <IMAGE-NAME>:<TAG>
*/}}

{{- define "imageTag" }}
{{- if (.Values.global.imageRepository) }}    
    {{- printf "%s/%s:%s" .Values.global.imageRepository .Values.image .Values.tag }}    
{{- else if (.Values.global.imageRegistry) }} 
    {{- printf "%s/%s:%s" .Values.global.imageRegistry .Values.image .Values.tag }}    
{{- else }} 
   {{- printf "%s:%s" .Values.image .Values.tag }} 
{{- end }}
{{- end }}