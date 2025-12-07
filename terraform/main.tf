terraform {
  required_providers {
    kubernetes = {
      source  = "hashicorp/kubernetes"
      version = "~> 2.23"
    }
  }
}

provider "kubernetes" {
  config_path = "~/.kube/config"
}

resource "kubernetes_namespace" "app" {
  metadata {
    name = "webapp-namespace"
  }
}

resource "kubernetes_deployment" "webapp" {
  metadata {
    name      = "webapp-deployment"
    namespace = kubernetes_namespace.app.metadata[0].name
  }

  spec {
    replicas = 3

    selector {
      match_labels = {
        app = "webapp"
      }
    }

    template {
      metadata {
        labels = {
          app = "webapp"
        }
      }

      spec {
        container {
          name  = "webapp"
          image = "nginx:alpine"

          port {
            container_port = 80
          }
        }
      }
    }
  }
}

resource "kubernetes_service" "webapp" {
  metadata {
    name      = "webapp-service"
    namespace = kubernetes_namespace.app.metadata[0].name
  }

  spec {
    selector = {
      app = "webapp"
    }

    port {
      port        = 80
      target_port = 80
    }

    type = "ClusterIP"
  }
}
