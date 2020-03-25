locals {
  nsg = {for nsg_map in var.nsg_maps: nsg_map.nsg_name => nsg_map}
}

resource "azurerm_network_security_group" "networkSecurityGroup" {
    for_each              = local.nsg
    name                  = each.key
    resource_group_name   = azurerm_resource_group.resourceGroup[each.value.nsg_rg_name].name
    location              = each.value.nsg_location
    tags                  = each.value.nsg_tags

    dynamic "security_rule"{
        for_each          = each.value.nsg_sec_rule
        content{
            name                    =each.value.security_rule
            protocol                =each.value.protocol
            source_port_range       =each.value.source_port_range
            source_port_ranges      =each.value.source_port_ranges
            destination_port_range  =each.value.destination_port_range
            destination_port_ranges =each.value.destination_port_ranges
            source_address_prefix   =each.source_address_prefix
            source_address_prefixes =each.source_address_prefixes
            source_application_security_group_ids   =each.source_application_security_group_ids
            destination_address_prefix              =each.destination_address_prefix
            destination_address_prefixes            =each.destination_address_prefixes
            destination_application_security_group_ids=each.destination_application_security_group_ids
            access                  =each.access
            priority                =each.priority
            direction               =each.direction
        }
    }
}