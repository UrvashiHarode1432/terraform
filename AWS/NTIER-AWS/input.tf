variable "vpc_network_cidr" {
  type    = string
  default = "10.10.0.0/16"
}

variable "subnet_name_cidr_function" {
  type    = list(string)
  default = ["w1", "w2", "a1", "a2", "d1", "d2"]
}

# variable "subnet_cidr_format" {
#   type    = string
#   default = "10.10.%g.0/24"
# }

# variable "subnet_name_format_function" {
#   type    = list(string)
#   default = ["subnet_1", "subnet_2", "subnet_3", "subnet_4"]
# }

variable "subnet_cidr_ranges" {
  type    = list(string)
  default = ["10.10.11.0/24", "10.10.12.0/24", "10.10.13.0/24", "10.10.14.0/24", "10.10.15.0/24", "10.10.16.0/24"]
}

variable "subnet_name" {
  type    = list(string)
  default = ["web1", "web2", "app1", "app2", "db1", "db2"]
}

variable "db_subnet_names" {
  type    = list(string)
  default = ["db1", "db2"]
}

variable "subnet_available_zones" {
  type    = list(string)
  default = ["ap-south-1a", "ap-south-1b", "ap-south-1c", "ap-south-1a", "ap-south-1b", "ap-south-1c"]
}

variable "web_sg_config" {
  type = object({
    name        = string
    description = string
    rules = list(object({
      type        = string
      from_port   = number
      to_port     = number
      protocol    = string
      cidr_blocks = list(string)
    }))
  })
  description = "this is web security group config"
}

variable "app_sg_config" {
  type = object({
    name        = string
    description = string
    rules = list(object({
      type        = string
      from_port   = number
      to_port     = number
      protocol    = string
      cidr_blocks = list(string)
    }))
  })
  description = "this is app security group config"
}

variable "db_sg_config" {
  type = object({
    name        = string
    description = string
    rules = list(object({
      type        = string
      from_port   = number
      to_port     = number
      protocol    = string
      cidr_blocks = list(string)
    }))
  })
  description = "this is db security group config"
}