resource "azurerm_virtual_network" "ntier_vnet" {
  name                = "ntier_vnet"
  resource_group_name = azurerm_resource_group.ntier.name
  address_space       = [var.network_range]
  location            = azurerm_resource_group.ntier.location

  #explicit dependency
  depends_on = [azurerm_resource_group.ntier]
}

resource "azurerm_subnet" "subnets" {
  count                = length(var.subnet_address_prefixes)
  resource_group_name  = azurerm_resource_group.ntier.name
  virtual_network_name = azurerm_virtual_network.ntier_vnet.name
  #get address prefix based on the count from variable subnet_address_prefixes
  #extra [] is given because list of string is required
  address_prefixes = [var.subnet_address_prefixes[count.index]]
  #get name based on the count from variable subnet_names
  #extr [] not given because string is required
  name = var.subnet_names[count.index]

  depends_on = [
    azurerm_resource_group.ntier,
    azurerm_virtual_network.ntier_vnet
  ]

}

resource "azurerm_subnet" "subnet_using_cidrsubnet_function" {
  count                = length(var.subnet_address_prefixes)
  resource_group_name  = azurerm_resource_group.ntier
  virtual_network_name = azurerm_virtual_network.ntier_vnet.name
  address_prefixes     = [cidrsubnet(var.network_range, 8, count.index)]
  name                 = var.subnet_names[count.index]

  depends_on = [
    azurerm_resource_group.ntier,
    azurerm_virtual_network.ntier_vnet
  ]

}

resource "azurerm_network_security_group" "webnsg" {
  name                = var.web_nsg_config.name
  resource_group_name = azurerm_resource_group.ntier.name
  location            = azurerm_resource_group.ntier.location

  depends_on = [azurerm_resource_group.ntier]
}

resource "azurerm_network_security_rule" "webnsg_rules" {
  count                       = length(var.web_nsg_config.rules)
  name                        = var.web_nsg_config.rules[count.index].name
  resource_group_name         = azurerm_resource_group.ntier.name
  network_security_group_name = azurerm_network_security_group.webnsg.name
  protocol                    = var.web_nsg_config.rules[count.index].protocol
  source_address_prefix       = var.web_nsg_config.rules[count.index].source_address_prefix
  source_port_range           = var.web_nsg_config.rules[count.index].source_port_range
  destination_port_range      = var.web_nsg_config.rules[count.index].destination_port_range
  direction                   = var.web_nsg_config.rules[count.index].direction
  priority                    = var.web_nsg_config.rules[count.index].priority
  access                      = var.web_nsg_config.rules[count.index].access
  destination_address_prefix  = var.web_nsg_config.rules[count.index].destination_address_prefix

  depends_on = [azurerm_network_security_group.webnsg]
}


resource "azurerm_network_security_group" "appnsg" {
  name                = var.app_nsg_config.name
  resource_group_name = azurerm_resource_group.ntier.name
  location            = azurerm_resource_group.ntier.location

  depends_on = [azurerm_resource_group.ntier]
}

resource "azurerm_network_security_rule" "appnsg_rules" {
  count                       = length(var.app_nsg_config.rules)
  name                        = var.app_nsg_config.rules[count.index].name
  resource_group_name         = azurerm_resource_group.ntier.name
  network_security_group_name = azurerm_network_security_group.appnsg.name
  protocol                    = var.app_nsg_config.rules[count.index].protocol
  source_address_prefix       = var.app_nsg_config.rules[count.index].source_address_prefix
  source_port_range           = var.app_nsg_config.rules[count.index].source_port_range
  destination_port_range      = var.app_nsg_config.rules[count.index].destination_port_range
  direction                   = var.app_nsg_config.rules[count.index].direction
  priority                    = var.app_nsg_config.rules[count.index].priority
  access                      = var.app_nsg_config.rules[count.index].access
  destination_address_prefix  = var.app_nsg_config.rules[count.index].destination_address_prefix

  depends_on = [azurerm_network_security_group.appnsg]
}









