/*provider "azurerm" {
  alias  = "src"
}

provider "azurerm"{
  alias  = "dst"
}
*/
locals {
  vnet_peering =  {for vnetPeering_map in var.vnetPeering_maps: vnetPeering_map.peer_number => vnetPeering_map}
}

data "azurerm_virtual_network" "vnet1_new" {
    provider            = azurerm.src
    for_each            = local.vnet_peering
    name                = local.vnet_peering[each.key].vnet_names[0]
    resource_group_name = local.vnet_peering[each.key].rg_names[0]
}

data "azurerm_virtual_network" "vnet2_new" {
    provider            = azurerm.dst
    for_each            = local.vnet_peering
    name                = local.vnet_peering[each.key].vnet_names[1]
    resource_group_name = local.vnet_peering[each.key].rg_names[1]
}

resource "azurerm_virtual_network_peering" "vnet_peer_1_new" {
    provider                     = azurerm.src
    for_each                     = local.vnet_peering
    name                         = local.vnet_peering[each.key].peer_names[0]#var.peer_names[count.index]
    resource_group_name          = local.vnet_peering[each.key].rg_names[0]#element(var.rg_names,count.index)
    virtual_network_name         = local.vnet_peering[each.key].vnet_names[0]#element(var.vnet_names,count.index)
    remote_virtual_network_id    = data.azurerm_virtual_network.vnet2_new[each.key].id
    allow_virtual_network_access = local.vnet_peering[each.key].allow_virtual_network_access[0]#var.allow_virtual_network_access
    allow_forwarded_traffic      = local.vnet_peering[each.key].allow_forwarded_traffic[0]#var.allow_forwarded_traffic
    use_remote_gateways          = local.vnet_peering[each.key].use_remote_gateways[0]#var.use_remote_gateways
}

resource "azurerm_virtual_network_peering" "vnet_peer_2_new" {
    provider                     = azurerm.dst
    for_each                     = local.vnet_peering
    name                         = local.vnet_peering[each.key].peer_names[1]#var.peer_names[count.index]
    resource_group_name          = local.vnet_peering[each.key].rg_names[1]#element(var.rg_names,count.index)
    virtual_network_name         = local.vnet_peering[each.key].vnet_names[1]#element(var.vnet_names,count.index)
    remote_virtual_network_id    = data.azurerm_virtual_network.vnet1_new[each.key].id
    allow_virtual_network_access = local.vnet_peering[each.key].allow_virtual_network_access[1]#var.allow_virtual_network_access
    allow_forwarded_traffic      = local.vnet_peering[each.key].allow_forwarded_traffic[1]#var.allow_forwarded_traffic
    use_remote_gateways          = local.vnet_peering[each.key].use_remote_gateways[1]#var.use_remote_gateways
}



