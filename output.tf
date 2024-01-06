output "vm_ip" {
  value = azurerm_linux_virtual_machine.ubuntu_vm.public_ip_addresses
}

output "rg_id" {
  value = azurerm_resource_group.rg.id
}

output "vnet_id" {
  value = azurerm_virtual_network.vnet.id
}

output "subnet_id" {
  value = azurerm_subnet.subnet.id
}

output "nsg_id" {
  value = azurerm_network_security_group.nsg.id
}

output "association_id" {
  value = azurerm_subnet_network_security_group_association.asnsga.id
}