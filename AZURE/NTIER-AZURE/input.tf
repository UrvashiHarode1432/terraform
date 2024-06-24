variable "resource_group_name" {
  type    = string
  default = "ntier"
}

variable "location" {
  type    = string
  default = "south"
}

variable "network_range" {
  type    = list(string)
  default = ["10.10.0.0/16"]
}