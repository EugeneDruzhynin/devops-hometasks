variable "ingress_name" {}
variable "host_name" {}
resource "kubernetes_ingress_v1" "example_ingress" {
  metadata {
    name = var.ingress_name
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
          backend {
            service {
              name = var.name
              port {
                number = var.number_of_ports
              }
            }
          }
          path = "/"
        }
      }    
    }
  }
}  
