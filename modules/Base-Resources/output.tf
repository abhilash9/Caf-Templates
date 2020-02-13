output "resourceGroup_ids" {
  value       = [for rg in azurerm_resource_group.resourceGroup:rg.id]
  description = ""
}

output "resourceGroup_names" {
  value       = [for rg in azurerm_resource_group.resourceGroup:rg.name]
  description = ""
}

output "resourceGroup_locations" {
  value       = [for rg in azurerm_resource_group.resourceGroup:rg.location]
  description = ""
}

output "resourceGroup_tags" {
  value       = [for rg in azurerm_resource_group.resourceGroup:rg.tags]
  description = ""
}