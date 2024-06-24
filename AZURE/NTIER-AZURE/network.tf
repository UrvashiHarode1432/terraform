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