resource "kubernetes_namespace" "ns" {

  metadata {
    name = "${var.my_ns}-namespace-${var.how_many}"
    annotations = {}
    labels = {
      "app.kubernetes.io/managed-by" = "Terraform"
      custom                         = var.label ? "my-custome-label" : ""
    }
  }
}


resource "kubernetes_pod" "mycontainer" {
  metadata {
    name = var.mycontainer.podname
    namespace = "${var.my_ns}-namespace-${var.how_many}"
    labels = merge( var.mycontainer.labels ,{
      "type" = "std-container"
      "app.kubernetes.io/managed-by" = "Terraform"
    })
  }

  spec {
    container {
      image = var.mycontainer.image
      name  = var.mycontainer.name

      port {
        container_port = var.mycontainer.port
      }
    }
  }
  depends_on = [
    kubernetes_namespace.ns
  ]
}
