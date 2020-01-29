variable "nsgAssociation_maps" {
  type        = list(any)
  default     = [
    {
      subnet_name = "New-01"
      vnet_name   = "Hub-01"
      vnet_rg_name= "RG-Prod"
      nsg_name    = "NSG-01"
      nsg_rg_name = "RG-Prod"
    },
    {
      subnet_name = "New-02"
      vnet_name   = "Hub-01"
      vnet_rg_name= "RG-Prod"
      nsg_name    = "NSG-01"
      nsg_rg_name = "RG-Prod"
    } 
  ]
  description = ""
}

variable "rtAssociation_maps" {
  type        = list(any)
  default     = [
      {
          rt_name       = "RT-01"
          rt_rg_name    = "RG-Prod"
          subnet_name   = "New-01"
          vnet_name     = "Hub-01"
          vnet_rg_name  = "RG-Prod"
      }
  ]
  description = ""
}