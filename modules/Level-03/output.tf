output "vm_maps" {
  value       = azurerm_windows_virtual_machine.virtualMachine
  description = ""
}

output "datadisk_maps" {
  value       = azurerm_virtual_machine_data_disk_attachment.datadiskVMAssociation
  description = ""
}

# output "vgwconnection_maps" {
#   value       = azurerm_virtual_network_gateway_connection.vgwConnection
#   description = ""
# }