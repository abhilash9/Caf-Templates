# locals {
#   vgwconnection = {for vgwconnection_map in var.vgwconnection_maps: vgwconnection_map.name => vgwconnection_map}
# }

# data "azurerm_virtual_network_gateway" "vpnGateway" {
#   for_each                   = local.vgwconnection

#   name                       = each.value.vgw_name
#   resource_group_name        = each.value.rg_name
# }

# data "azurerm_local_network_gateway" "localNwGateway" {
#   for_each                   = local.vgwconnection

#   name                       = each.value.localgw_name
#   resource_group_name        = each.value.rg_name
# }

# resource "azurerm_virtual_network_gateway_connection" "vgwConnection" {
#   for_each                   = local.vgwconnection
  
#   name                       = each.value.name
#   location                   = each.value.location
#   resource_group_name        = each.value.rg_name

#   type                       = each.value.type
#   virtual_network_gateway_id = data.azurerm_virtual_network_gateway.vpnGateway[each.value.name].id
#   local_network_gateway_id   = data.azurerm_local_network_gateway.localNwGateway[each.value.name].id

#   shared_key                 = each.value.shared_key

#   tags                       = each.value.tags
# }