data "azurerm_virtual_network" "vnet1" {
  provider            = azurerm.crossTenant-ran
  name                = "${var.vnet_names[0]}"
  resource_group_name = "${var.rg_names[0]}"
}

data "azurerm_virtual_network" "vnet2" {
  provider            = azurerm.crossTenant-nfp
  name                = "${var.vnet_names[1]}"
  resource_group_name = "${var.rg_names[1]}"
}

resource "azurerm_virtual_network_peering" "vnet_peer_1" {
  provider                     = azurerm.crossTenant-ran
  name                         = var.peer_names[0]
  resource_group_name          = var.rg_names[0]
  virtual_network_name         = var.vnet_names[0]
  remote_virtual_network_id    = data.azurerm_virtual_network.vnet2.id
  allow_virtual_network_access = var.allow_virtual_network_access
  allow_forwarded_traffic      = var.allow_forwarded_traffic
  use_remote_gateways          = var.use_remote_gateways
}

resource "azurerm_virtual_network_peering" "vnet_peer_2" {
  provider                     = azurerm.crossTenant-nfp
  name                         = var.peer_names[1]
  resource_group_name          = var.rg_names[1]
  virtual_network_name         = var.vnet_names[1]
  remote_virtual_network_id    = data.azurerm_virtual_network.vnet1.id
  allow_virtual_network_access = var.allow_virtual_network_access
  allow_forwarded_traffic      = var.allow_forwarded_traffic
  use_remote_gateways          = var.use_remote_gateways
}


