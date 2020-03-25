locals {
  rg = {for rg_map in var.rg_maps: rg_map.rg_name => rg_map } 
}

resource "azurerm_resource_group" "resourceGroup" {
    for_each        = local.rg
    name            = each.key
    location        = each.value.rg_location
    tags            = each.value.rg_tags
}