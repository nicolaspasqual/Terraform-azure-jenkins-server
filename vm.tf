resource "azurerm_resource_group" "rg" {
  name     = var.rg
  location = var.location
}

resource "azurerm_public_ip" "public_ip" {
  name                = "PublicIP"
  resource_group_name = azurerm_resource_group.rg.name
  location            = var.location
  allocation_method   = "Dynamic"

  tags = local.tags
}

resource "azurerm_network_interface" "net_interface" {
  name                = "Terraform-vm-nic"
  resource_group_name = azurerm_resource_group.rg.name
  location            = var.location

  ip_configuration {
    name                          = "internal"
    subnet_id                     = azurerm_subnet.subnet.id
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id          = azurerm_public_ip.public_ip.id
  }

  tags = local.tags
}

resource "azurerm_linux_virtual_machine" "ubuntu_vm" {
  name                  = var.vm-name
  resource_group_name   = azurerm_resource_group.rg.name
  location              = var.location
  size                  = var.vm_size
  admin_username        = var.admin_user
  network_interface_ids = [azurerm_network_interface.net_interface.id]

  admin_ssh_key {
    username   = var.admin_user
    public_key = file("~/.ssh/id_rsa.pub")
  }

  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  source_image_reference {
    publisher = var.os_publicher
    offer     = var.os_offer
    sku       = var.os_version
    version   = "latest"
  }

  tags = local.tags

  connection {
    type        = "ssh"
    user        = "terraform"
    private_key = file("~/.ssh/id_rsa")
    host        = self.public_ip_address
  }

  provisioner "file" {
    source      = "./scripts/install-jenkins.sh"
    destination = "/tmp/script.sh"
  }

  provisioner "remote-exec" {
    inline = [
      "chmod +x /tmp/script.sh",
      "/tmp/script.sh args",
    ]
  }
}