variable "nsgAssociation_maps" {
  type        = list(any)
  default     = []
  description = ""
}

variable "rtAssociation_maps" {
  type        = list(any)
  default     = []
  description = ""
}

#---------------------------------------------------------------------------------------------
# Variables for VNet-Peerings Config
#---------------------------------------------------------------------------------------------
variable "peer_names" {
  type        = list(any)
  default     = []
  description = ""
}

variable "rg_names" {
  type        = list(any)
  default     = []
  description = ""
}

variable "vnet_names" {
  type        = list(any)
  default     = []
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


#---------------------------------------------------------------------------------------------
# Variables for VNet-Peerings-New Config
#---------------------------------------------------------------------------------------------
variable "vnetPeering_maps" {
  type        = list(any)
  default     = []
  description = ""
}