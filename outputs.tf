output "virtual_network_name" {
    value = "${azurerm_virtual_network.vnet.*.name}"
}

output "public_subnet_name" {
    value = "${azurerm_subnet.public_subnet.*.name}"
}

output "private_subnet_name" {
    value = "${azurerm_subnet.private_subnet.*.name}"
}