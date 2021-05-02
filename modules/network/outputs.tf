output "resource_group_name" {
  value = azurerm_resource_group.rg.name
}

output "location" {
  value = azurerm_resource_group.rg.location
}

output "vnet" {
  value = azurerm_virtual_network.vnet.name
}

output "network_interface_ids_public_linuxMaster" {
 value = azurerm_network_interface.nicPublic[0].id
}

output "network_interface_ids_public_linuxCI-CD" {
 value = azurerm_network_interface.nicPublic[1].id
}

output "network_interface_ids_public_linuxVM1" {
 value = azurerm_network_interface.nicPublic[2].id
}

output "network_interface_ids_public_linuxVM2" {
 value = azurerm_network_interface.nicPublic[3].id
}

output "network_interface_ids_private_DB" {
  value = azurerm_network_interface.nicPrivate.id
}


output "availability_set_public" {
  value = azurerm_availability_set.avsetPublic.id
}

output "availability_set_private" {
  value = azurerm_availability_set.avsetPrivate.id
}