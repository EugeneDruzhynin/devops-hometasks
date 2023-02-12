resource "kubernetes_namespace_v1" "wcg-ns" {
  metadata {
    name = var.namespace_name
  }
}