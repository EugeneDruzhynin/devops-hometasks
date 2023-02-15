variable "name" {}
variable "labels_name" {}
variable "number_of_replic" {}
variable "secrets_name" {}
variable "image_name" {}
resource "kubernetes_deployment_v1" "wcg-dep" {
  metadata {
    name      = var.name
    namespace = var.namespace_name
    labels = {
      app = var.labels_name
    }
  }

  spec {
    replicas = var.number_of_replic

    selector {
      match_labels = {
        app = var.labels_name
      }
    }

    template {
      metadata {
        labels = {
          app = var.labels_name
        }
      }

      spec {
        image_pull_secrets {
          name = var.secrets_name
        }
        container {
          image             = var.image_name
          name              = var.name
          image_pull_policy = "Always"

          resources {}
        }
      }
    }
  }
}