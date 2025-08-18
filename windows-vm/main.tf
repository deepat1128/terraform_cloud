resource "azurerm_resource_group" "example" {
		  name     = var.rgname
		  location = var.location
		} 
resource "azurerm_virtual_network" "example" {
	name = var.vnetname
	resource_group_name = azurerm_resource_group.example.name
	location = var.location
	address_space = var.addresspace
	}

resource "azurerm_subnet" "example" {
		  name                 = var.snetname
		  resource_group_name  = azurerm_resource_group.example.name
		  virtual_network_name = azurerm_virtual_network.example.name
		  address_prefixes     = var.saddresspace 
}

resource "azurerm_public_ip" "example" {
		  name                = var.pip
		  resource_group_name = azurerm_resource_group.example.name
		  location            = azurerm_resource_group.example.location
		  allocation_method   = "Static"

		}

resource "azurerm_network_security_group" "example" {
		  name                = var.nsg
		  location            = azurerm_resource_group.example.location
		  resource_group_name = azurerm_resource_group.example.name

		  security_rule {
			name                       = "deepa123-win2"
			priority                   = 1000
			direction                  = "Inbound"
			access                     = "Allow"
			protocol                   = "Tcp"
			source_port_range          = "*"
			destination_port_range     = "3389"
			source_address_prefix      = "*"
			destination_address_prefix = "*"
		  }
		  
		  }
resource "azurerm_network_interface" "example" {
			  name                = var.nic
			  location            = azurerm_resource_group.example.location
			  resource_group_name = azurerm_resource_group.example.name

			  ip_configuration {
				name                          = var.ipconfigname
				subnet_id                     = azurerm_subnet.example.id
				private_ip_address_allocation = "Dynamic"
                public_ip_address_id          = azurerm_public_ip.example.id
			  }
		}

resource "azurerm_network_interface_security_group_association" "example" {
			  network_interface_id      = azurerm_network_interface.example.id
			  network_security_group_id = azurerm_network_security_group.example.id
			}
resource "azurerm_subnet_network_security_group_association" "example" {
			  subnet_id      = azurerm_subnet.example.id
			  network_security_group_id = azurerm_network_security_group.example.id
			}

resource "azurerm_windows_virtual_machine" "example" {
  name                = var.vmname
  resource_group_name = azurerm_resource_group.example.name
  location            = azurerm_resource_group.example.location
  size                = var.size
  admin_username      = var.username
  admin_password      = var.password

  network_interface_ids = [
    azurerm_network_interface.example.id,
  ]
depends_on = [
    azurerm_network_interface.example
  ]

  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  source_image_reference {
    publisher = var.image.publisher
    offer     = var.image.offer
    sku       = var.image.sku
    version   = var.image.version
  }

  winrm_listener {
    protocol = "Http"
  }

  provision_vm_agent = true
  enable_automatic_updates = true
}

