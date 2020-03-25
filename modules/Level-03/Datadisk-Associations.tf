locals {
  datadisk = {for datadisk_map in var.datadisk_maps:datadisk_map.datadisk_name => datadisk_map} 
}

data "azurerm_managed_disk" "managedDisk" {
  for_each            = local.datadisk
  name                = each.value.datadisk_name
  resource_group_name = each.value.rg_name
}

resource "azurerm_virtual_machine_data_disk_attachment" "datadiskVMAssociation" {
  for_each            = local.datadisk

  managed_disk_id     = data.azurerm_managed_disk.managedDisk[each.value.datadisk_name].id
  virtual_machine_id  = azurerm_windows_virtual_machine.virtualMachine[each.value.vm_name].id
  lun                 = each.value.lun
  caching             = each.value.caching
}