locals {
  vm = {for vm_map in var.vm_maps: vm_map.name => vm_map} 

  # avset = {
  #   for vm_name in keys(var.vm_maps[*].name): vm_name => var.vm_maps[*].name[vm_name] if var.vm_maps[*].name[vm_name] != {}
  # }
  avset = {
    for key,value in var.vm_maps:
      value.name => value.availability_set   
      if value.availability_set != {}
  }

  boot_diagnostics = {
    for vm_map in var.vm_maps:
      vm_map.name => vm_map.boot_diagnostics if vm_map.boot_diagnostics != {}
  }
}

data "azurerm_network_interface" "networkInterface" {
  for_each              = local.vm 

  name                  = each.value.nic_name
  resource_group_name   = each.value.rg_name
}

data "azurerm_storage_account" "storageAccounts" {
  for_each              = local.boot_diagnostics

  name                  = each.value.storage_account_name
  resource_group_name   = each.value.sa_rg_name
}

data "azurerm_availability_set" "availabilitySets" {
  for_each              = local.avset

  name                  = each.value.name
  resource_group_name   = each.value.avset_rg_name
}

resource "azurerm_windows_virtual_machine" "virtualMachine" {
  for_each                      = local.vm

  admin_password                = each.value.admin_password
  admin_username                = each.value.admin_username
  name                          = each.value.name
  location                      = each.value.location
  network_interface_ids         = [data.azurerm_network_interface.networkInterface[each.value.name].id]
  dynamic "os_disk"{
      for_each                  = each.value.os_disk
      content{
          caching               = os_disk.value.caching
          storage_account_type  = os_disk.value.sa_type
          disk_size_gb          = os_disk.value.disksize_gb
          name                  = os_disk.value.name
      }   
  }
  resource_group_name           = each.value.rg_name
  size                          = each.value.size
  allow_extension_operations    = each.value.allow_extension_operations
  availability_set_id           = each.value.availability_set != {} ? data.azurerm_availability_set.availabilitySets[each.value.name].id : null
  boot_diagnostics{
      storage_account_uri   = data.azurerm_storage_account.storageAccounts[each.value.name].primary_blob_endpoint   
  }
  license_type                  = each.value.license_type
  dynamic "source_image_reference"{
      for_each                  = each.value.source_image_reference

      content{
          publisher             = source_image_reference.value.publisher
          offer                 = source_image_reference.value.offer
          sku                   = source_image_reference.value.sku
          version               = source_image_reference.value.version
      }
  }
  tags                  = each.value.tags
}


