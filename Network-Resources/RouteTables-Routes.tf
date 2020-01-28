locals {
  routetable = {for rt_map in var.rt_maps: rt_map.rt_name => rt_map}
}

resource "azurerm_route_table" "routeTable" {
    for_each                       = local.routetable
    name                           = each.key
    resource_group_name            = each.value.rt_rg_name
    location                       = each.value.rt_location
    disable_bgp_route_propagation = each.value.rt_disable_bgp_route_propagation
    tags                = each.value.rt_tags
    dynamic "route"{
        for_each = each.value.rt_route 
        content {
            name = route.key
            address_prefix = route.value.route_address_prefix
            next_hop_type = route.value.route_next_hop_type
            next_hop_in_ip_address = route.value.route_next_hop_in_ip_address
        }        
    }
   
}