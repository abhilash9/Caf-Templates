locals {
  localnwgateway = {for localnwgateway_map in var.localnwgateway_maps:localnwgateway_map.name => localnwgateway_map} 
}

resource "azurerm_local_network_gateway" "localNwGateway" {
    for_each            = local.localnwgateway

    name                = each.value.name
    resource_group_name = each.value.rg_name
    location            = each.value.location

    gateway_address     = each.value.onprem_gw_ip
    address_space       = each.value.onprem_address_space
    tags                = each.value.tags
  
}