
#using this file, then write aply command like ` terraform apply -var-file="dev.tfvars" `
resource_group_name = "ntier-dev"
location            = "ap-south-1"
network_range       = ["10.10.0.0/16"]
web_nsg_config = [{
  name = "webnsg"
  rules = [{
    name                        = "openssh"
    resource_group_name         = azurerm_resource_group.ntier.name
    network_security_group_name = azurerm_network_security_group.webnsg.name
    protocol                    = "Tcp"
    source_address_prefix       = "*"
    source_port_range           = "*"
    destination_port_range      = "22"
    direction                   = "Inbound"
    priority                    = "310"
    access                      = "Allow"
    destination_address_prefix  = "*"
    },
    {
      name                        = "openhttp"
      resource_group_name         = azurerm_resource_group.ntier.name
      network_security_group_name = azurerm_network_security_group.webnsg.name
      protocol                    = "Tcp"
      source_address_prefix       = "*"
      source_port_range           = "*"
      destination_port_range      = "80"
      direction                   = "Inbound"
      priority                    = "300"
      access                      = "Allow"
      destination_address_prefix  = "*"
  }]
}]

app_nsg_config = [{
  name = "appnsg"
  rules = [{
    name                        = "open22"
    resource_group_name         = azurerm_resource_group.ntier.name
    network_security_group_name = azurerm_network_security_group.webnsg.name
    protocol                    = "Tcp"
    source_address_prefix       = "*"
    source_port_range           = "*"
    destination_port_range      = "22"
    direction                   = "Inbound"
    priority                    = "310"
    access                      = "Allow"
    destination_address_prefix  = "*"
    },
    {
      name                        = "open8080"
      resource_group_name         = azurerm_resource_group.ntier.name
      network_security_group_name = azurerm_network_security_group.webnsg.name
      protocol                    = "Tcp"
      source_address_prefix       = "*"
      source_port_range           = "*"
      destination_port_range      = "8080"
      direction                   = "Inbound"
      priority                    = "300"
      access                      = "Allow"
      destination_address_prefix  = "*"
  }]
}]

db_info = {
  db_name        = "employee"
  server_name    = "sqlserverfromtf"
  server_version = 12
  user_name      = "root"
  password       = "root@123"
  sku_name       = "Basic"
  max_size_gb    = 2
}

