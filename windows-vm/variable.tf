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
