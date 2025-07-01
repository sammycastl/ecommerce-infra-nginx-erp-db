resource "azurerm_linux_virtual_machine" "erp1" {
  name                = "erp1-${var.project}-${var.environment}"
  resource_group_name = azurerm_resource_group.rg.name
  location            = azurerm_resource_group.rg.location
  size                = "Standard_B2s"
  admin_username      = "adminuser"
  /*
  TODO: ESTE RECURSO TAMPOCO EXISTE (NO HAY REFERENCIAS) 
  network_interface_ids = [azurerm_network_interface.erp1.id]
  */

  network_interface_ids = [  ]

  admin_ssh_key {
    username   = "adminuser"
    public_key = var.ssh_public_key != "" ? var.ssh_public_key : file("~/.ssh/id_rsa.pub")
  }

  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  source_image_reference {
    publisher = "Canonical"
    offer     = "UbuntuServer"
    sku       = "20.04-LTS" 
    version = "latest" 
  }

  tags = var.tags
}

