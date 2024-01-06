resource "azurerm_virtual_network" "vnet" {
  name                = var.vnet-name
  location            = var.location
  resource_group_name = azurerm_resource_group.rg.name
  address_space       = var.adress_space

  tags = local.tags
}

resource "azurerm_subnet" "subnet" {
  name                 = var.subnet-name
  resource_group_name  = azurerm_resource_group.rg.name
  virtual_network_name = azurerm_virtual_network.vnet.name
  address_prefixes     = var.adress_prefix
}

resource "azurerm_network_security_group" "nsg" {
  name                = var.nsg-name
  location            = var.location
  resource_group_name = azurerm_resource_group.rg.name

  security_rule {
    name                       = "ssh"
    priority                   = 100
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "22"
    source_address_prefix      = var.source_address_prefix
    destination_address_prefix = "*"
  }

  security_rule {
    name                       = "jenkins"
    priority                   = 101
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "8080"
    source_address_prefix      = var.source_address_prefix
    destination_address_prefix = "*"
  }

  tags = local.tags
}

resource "azurerm_subnet_network_security_group_association" "asnsga" {
  subnet_id                 = azurerm_subnet.subnet.id
  network_security_group_id = azurerm_network_security_group.nsg.id
}