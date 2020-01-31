data "azurerm_virtual_network" "vnet1" {
  count               = length(var.vnet_names)
  name                = var.vnet_names[count.index]
  resource_group_name = element(var.rg_names,count.index)
}

resource "azurerm_virtual_network_peering" "vnet_peer_1" {
  count                        = length(var.peer_names) == 2 ? 1 : 0
  name                         = var.peer_names[count.index]
  resource_group_name          = element(var.rg_names,count.index)
  virtual_network_name         = element(var.vnet_names,count.index)
  remote_virtual_network_id    = data.azurerm_virtual_network.vnet1[count.index+1].id
  allow_virtual_network_access = var.allow_virtual_network_access
  allow_forwarded_traffic      = var.allow_forwarded_traffic
  use_remote_gateways          = var.use_remote_gateways
}

resource "azurerm_virtual_network_peering" "vnet_peer_2" {
  count                        = length(var.peer_names) == 2 ? 1 : 0
  name                         = var.peer_names[count.index+1]
  resource_group_name          = element(var.rg_names,count.index+1)
  virtual_network_name         = element(var.vnet_names,count.index+1)
  remote_virtual_network_id    = data.azurerm_virtual_network.vnet1[count.index].id
  allow_virtual_network_access = var.allow_virtual_network_access
  allow_forwarded_traffic      = var.allow_forwarded_traffic
  use_remote_gateways          = var.use_remote_gateways
}


