variable "vpc_network_cidr" {
  type    = string
  default = "10.10.0.0/16"
}

variable "web1_subnet_cidr" {
  type    = string
  default = "10.10.0.0/24"
}