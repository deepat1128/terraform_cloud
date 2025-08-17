variable rgname {
	default = "rg-deepa"
	}
variable location {
	default = "West US 2"
	}
variable vnetname {
	default = "vnet-deepa"
	}
variable addresspace {
	default = ["10.0.0.0/16"]
	type = list(string)
	}

variable snetname{
			default = "snet-deepa"
		}
	variable saddresspace{
			default = ["10.0.1.0/24"]
			type = list(string)
		}
variable pip{
			default = "publicip-deepa"
		}

variable nsg{
			default = "nsg-deepa"
		}
variable nic{
			default = "nic-deepa"
		}
		variable ipconfigname{
			default = "ipdeepa"
		}
