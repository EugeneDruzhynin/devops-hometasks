variable "ports_name" {}
variable "number_of_ports" {}
resource "kubernetes_service_v1" "wcg-service" {
  metadata {
    name      = var.name
    namespace = var.namespace_name
  }
  spec {
    selector = {
      app = var.name
    }
    port {
      name = var.ports_name
      port = var.number_of_ports
    }
  }
}