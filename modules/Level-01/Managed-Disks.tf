locals {
  manageddisk = {for manageddisk_map in var.manageddisk_maps:manageddisk_map.disk_name => manageddisk_map} 
}

resource "azurerm_managed_disk" "managedDisk" {
  for_each            = local.manageddisk

  name                = each.value.disk_name
  location            = each.value.location
  resource_group_name = azurerm_resource_group.resourceGroup[each.value.rg_name].name
  storage_account_type= each.value.storage_type
  create_option       = each.value.create_option
  disk_size_gb        = each.value.disk_size_gb
  tags                = each.value.tags
}