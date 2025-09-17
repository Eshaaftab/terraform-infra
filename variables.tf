variable "container_name" {
  type        = string
  default     = "frontend"
  description = "Name of the frontend container"
}

variable "external_port" {
  type        = number
  default     = 80
  description = "External port to expose"
}
