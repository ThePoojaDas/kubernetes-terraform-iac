output "namespace" {
  value = kubernetes_namespace.app.metadata[0].name
}

output "deployment_name" {
  value = kubernetes_deployment.webapp.metadata[0].name
}
