locals {
  stracc = {for stracc_map in var.stracc_maps: stracc_map.name => stracc_map} 
}

resource "azurerm_storage_account" "storageAccounts" {
  for_each              = local.stracc

  name                  = each.value.name
  resource_group_name   = azurerm_resource_group.resourceGroup[each.value.rg_name].name
  location              = each.value.location
  account_tier          = each.value.account_tier
  account_replication_type = each.value.account_replication_type
  tags                  = each.value.tags
}