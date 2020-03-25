locals {
  avset = {for avset_map in var.avset_maps: avset_map.name => avset_map} 
}

resource "azurerm_availability_set" "availabilitySets" {
    for_each                    = local.avset

    name                        = each.value.name
    resource_group_name         = azurerm_resource_group.resourceGroup[each.value.rg_name].name
    location                    = each.value.location
    tags                        = each.value.tags
    platform_update_domain_count= each.value.ud_count != null ? each.value.ud_count: 5
    platform_fault_domain_count = each.value.fd_count != null ? each.value.fd_count: 3
}