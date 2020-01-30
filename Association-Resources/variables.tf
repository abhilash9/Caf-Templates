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

#---------------------------------------------------------------------------------------------
# Variables for VNet-Peerings Config
#---------------------------------------------------------------------------------------------
variable "peer_names" {
  type        = list(any)
  default     = ["peer1","peer2"]
  description = ""
}

variable "rg_names" {
  type        = list(any)
  default     = ["RG-05","RG-06"]
  description = ""
}

variable "vnet_names" {
  type        = list(any)
  default     = ["Vnet-05","Vnet-06"]
  description = ""
}

variable "allow_virtual_network_access" {
  type        = string
  default     = true
  description = ""
}

variable "allow_forwarded_traffic" {
  type        = string
  default     = true
  description = ""
}

variable "use_remote_gateways" {
  type        = string
  default     = false
  description = ""
}