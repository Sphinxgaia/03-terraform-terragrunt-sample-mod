
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
    labels  = map(string)
    image   = string
    name    = string
    port    = number
  })
}
