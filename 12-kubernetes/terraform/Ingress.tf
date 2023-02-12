variable "ingress_name" {}
variable "host_name" {}
variable "number_of_ports" {}
resource "kubernetes_ingress_v1" "wcg-ingress" {
  metadata {
    name      = var.ingress_name
    namespace = var.namespace_name
    labels = {
      app = var.name
    }
  }

  spec {
    rule {
      host = var.host_name
      http {
        path {
          path_type = "Prefix"
          path      = "/"
          backend {
            service {
              name = var.name
              port {
                number = var.number_of_ports
              }
            }
          }
        }
      }
    }
  }
}        