variable rgname {
	default = "rg-deepa-win2"
	}
variable location {
	default = "Central US"
	}
variable vnetname {
	default = "vnet-deepa-win2"
	}
variable addresspace {
	default = ["10.3.0.0/16"]
	type = list(string)
	}

variable snetname{
			default = "snet-deepa-win2"
		}
	variable saddresspace{
			default = ["10.3.1.0/24"]
			type = list(string)
		}
variable pip{
			default = "publicip-deepa-win2"
		}

variable nsg{
			default = "nsg-deepa-win2"
		}
variable nic{
			default = "nic-deepa-win2"
		}
		variable ipconfigname{
			default = "ipdeepa-win2"
		}
variable "vmname" {
  default = "win-vm-deepa2"
  type        = string
}

variable "size" {
  default = "Standard_D4s_v3"
  type        = string
}

variable "username" {
  default = "deepa"
  type        = string
}

variable "password" {
  default = "Deepat@1128"
  type        = string
  sensitive   = true
}

variable "image" {
  description = "Image details for the Windows VM"
  type = object({
    publisher = string
    offer     = string
    sku       = string
    version   = string
  })
 default = {
    publisher = "MicrosoftWindowsServer"
    offer     = "WindowsServer"
    sku       = "2022-Datacenter"
    version   = "latest"
  }
}
output "vm_public_ip" {
  description = "Public IP address of the VM"
  value       = azurerm_public_ip.example.ip_address
}
