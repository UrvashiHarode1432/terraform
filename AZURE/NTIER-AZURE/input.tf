variable "resource_group_name" {
  type    = string
  default = "ntier"
}

variable "location" {
  type    = string
  default = "ap-south-1"
}

variable "network_range" {
  type    = string
  default = "10.10.0.0/16"
}

variable "subnet_names" {
  type    = list(string)
  default = ["web", "app", "db"]
}

variable "subnet_address_prefixes" {
  type    = list(string)
  default = ["10.10.0.0/24", "10.10.1.0/24", "10.10.2.0/24"]
}