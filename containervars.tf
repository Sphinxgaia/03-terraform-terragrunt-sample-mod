
variable "deploy_namespace" {
  description = "Your prefix namespace"
  type        = bool
  default     = "false"
}
variable "namespace" {
  description = "Your prefix namespace"
  type        = string
  default     = "my_ns"
}

variable "how_many" {
  description = "How many namespace ?"
  type        = number
  default     = 1
}

variable "label" {
  description = "add custom label"
  type        = bool
  default     = false
}

variable "mycontainer" {
  description = "Définition d'un container"
  type = object({
    podname = string
    namespace = string
    labels  = map(string)
    image   = string
    name    = string
    port    = number
  })

  default = {
    podname = ""
    namespace = ""
    labels  = {}
    image   = ""
    name    = ""
    port    = 0
  }
}
