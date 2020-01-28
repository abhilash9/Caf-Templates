variable "vnet_maps" {
  type        = list(any)
  default     = []
  description = ""
}

variable "nsg_maps" {
  type        = list(any)
  default     = []
  description = ""
}

variable "rt_maps" {
  type        = list(any)
  default     = []
  description = ""
}

variable "nsgAssociation_maps" {
  type        = list(any)
  default     = [
    {
      subnet_name = "Adcs-01"
      vnet_name   = "Hub-01"
      vnet_rg_name= "RG-Prod"
      nsg_name    = "NSG-01"
      nsg_rg_name = "RG-Prod"
    }
  ]
  description = ""
}