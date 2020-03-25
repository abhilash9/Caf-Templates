locals {
  pip = {for pip_map in var.pip_maps: pip_map.name => pip_map}
}

resource "azurerm_public_ip" "publicIP" {
  for_each              =  local.pip

  name                  = each.value.name
  resource_group_name   = azurerm_resource_group.resourceGroup[each.value.rg_name].name
  location              = each.value.location
  sku                   = each.value.sku
  allocation_method     = each.value.allocation_method
  domain_name_label     = each.value.dns_label
  public_ip_prefix_id   = each.value.pip_prefix_id
  tags                  = each.value.tags
}
