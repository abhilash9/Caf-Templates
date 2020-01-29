#---------------------------------------------------------------------------------------------
# Output from the NSG-Associations Config
#---------------------------------------------------------------------------------------------
/*
output "nsgAssociation_subnet_ids" {
  value       = flatten([for subnet in data.azurerm_subnet.subnetData: subnet.id])
  description = ""
}

output "nsgAssociation_nsg_ids" {
  value       = flatten([for nsg in data.azurerm_network_security_group.nsgData: nsg.id])
  description = ""
}

output "test" {
  value       = zipmap(flatten([for subnet in data.azurerm_subnet.subnetData: subnet.id]),flatten([for nsg in data.azurerm_network_security_group.nsgData: nsg.id]))
  description = ""
}
*/