locals {
    vnet = {for vnet_map in var.vnet_maps: vnet_map.vnet_name => vnet_map} 
}

resource "azurerm_virtual_network" "virtualNetwork" {
    for_each                = local.vnet
    name                    = each.key
    resource_group_name     = each.value.vnet_rg_name
    address_space           = each.value.vnet_addr_space
    location                = each.value.vnet_location
    dns_servers             = each.value.vnet_dns_servers
    tags                    = each.value.vnet_tags

    dynamic "subnet"{
        for_each            = each.value.subnet
        content{
            name            = subnet.value.sub_name
            address_prefix  = subnet.value.sub_addr_space
            security_group  = subnet.value.sub_nsg_group
        }
    }
}

