module "Config-Level-03" {
  source  = ".//modules/Level-03"
  providers= {
      azurerm = azurerm.crossTenant-mw
      azurerm.src = azurerm.crossTenant-mw
      azurerm.dst = azurerm.crossTenant-mw
  }

   vm_maps  = [
      {
          admin_password             = "Motifworks@123"
          admin_username             = "Motifadmin"
          name                       = "vmeastustest01"
          location                   = "EastUs2"
          nic_name                   = "nic-test-01"
          os_disk                    =[
              {
                  caching            = "ReadWrite"
                  sa_type            = "Standard_LRS"
                  disksize_gb        = null
                  name               = null
              }
          ]
          rg_name                    = "RG-NET-New-01"
          size                       = "Standard_F2"
          allow_extension_operations = null
          availability_set_name      = "av-set-01"
          boot_diagnostics           = {
              storage_account_name   = "samwterraformtest01"
          }
          license_type               = "None"
          source_image_reference     = [
              {
                  publisher          = "MicrosoftWindowsServer"
                  offer              = "WindowsServer"
                  sku                = "2016-Datacenter"
                  version            = "latest"
              }
          ]
          tags                       = null
      }
   ]

  datadisk_maps         = [
      {
          datadisk_name      = "Disk-01"
          rg_name            = "RG-NET-New-01"
          vm_name            = "vmeastustest01"
          lun                = "10"
          caching            = "ReadWrite"
      }
  ]

  vgwconnection_maps         = [
      {
          name                  = "connection-01"
          location              = "EastUs2"
          rg_name               = "RG-NET-New-01"
          type                  = "IPSec"
          vgw_name              = "vpn-gw-01"
          localgw_name          = "local-gw-01"
          shared_key            = "Motifworks@123"
          tags                  = {
              source            = "Terraform"
          }
      }
  ]

}
