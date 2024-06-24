variable "vpc_network_cidr" {
  type    = string
  default = "10.10.0.0/16"
}

variable "subnet_cidr_format" {
  type    = string
  default = "10.10.%g.0/24"
}

variable "subnet_name_format_function" {
  type    = list(string)
  default = ["subnet_1", "subnet_2", "subnet_3", "subnet_4"]
}

variable "subnet_cidr_ranges" {
  type    = list(string)
  default = ["10.10.11.0/24", "10.10.12.0/24", "10.10.13.0/24", "10.10.14.0/24"]
}

variable "subnet_name" {
  type    = list(string)
  default = ["web1", "web2", "app1", "app2", "db1", "db2"]
}