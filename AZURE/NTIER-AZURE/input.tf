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

variable "web_nsg_config" {
  type = object({
    name = string
    rules = list(object({
      name                       = string
      protocol                   = string
      source_address_prefix      = string
      source_port_range          = string
      destination_port_range     = string
      direction                  = string
      priority                   = string
      access                     = string
      destination_address_prefix = string
    }))
  })
}

variable "app_nsg_config" {
  type = object({
    name = string
    rules = list(object({
      name                       = string
      protocol                   = string
      source_address_prefix      = string
      source_port_range          = string
      destination_port_range     = string
      direction                  = string
      priority                   = string
      access                     = string
      destination_address_prefix = string
    }))
  })
}







