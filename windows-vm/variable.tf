variable rgname {
	default = "rg-deepa-win"
	}
variable location {
	default = "West US 2"
	}
variable vnetname {
	default = "vnet-deepa-win"
	}
variable addresspace {
	default = ["10.2.0.0/16"]
	type = list(string)
	}

variable snetname{
			default = "snet-deepa-win"
		}
	variable saddresspace{
			default = ["10.2.1.0/24"]
			type = list(string)
		}
variable pip{
			default = "publicip-deepa-win"
		}

variable nsg{
			default = "nsg-deepa-win"
		}
variable nic{
			default = "nic-deepa-win"
		}
		variable ipconfigname{
			default = "ipdeepa-win"
		}
variable "vmname" {
  description = "Name of the Virtual Machine"
  type        = string
}

variable "size" {
  size = "Standard_D4s_v3"
  type        = string
}

variable "username" {
  description = "Admin username for the VM"
  type        = string
}

variable "password" {
  description = "Admin password for Windows VM"
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
