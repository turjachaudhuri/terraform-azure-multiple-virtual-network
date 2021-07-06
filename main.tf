resource "azurerm_virtual_network" "vnet" {
  count               = "${length(var.vnet_definition)}"
  name                = "${format("%s-%s-%s-%s-%s",lookup(var.regionnamingconventionmaplookupnc,var.location),var.entity,"VNT",var.enviornment,lookup(var.vnet_definition[count.index],"vnet_identifier"))}"
  location            = "${var.location}"
  address_space       = ["${lookup(var.vnet_definition[count.index],"vnet_CIDR")}"]
  resource_group_name = "${var.resource_group}"
  dns_servers         = ["${split(",",lookup(var.dns_map,var.location))}"]
  tags                = "${var.tags}"
}

resource "azurerm_subnet" "public_subnet" {
  depends_on = ["azurerm_virtual_network.vnet"]
  count = "${length(var.public_subnet_definition)}"
  name                 = "${format("%s-%s-%s-%s-%s",lookup(var.regionnamingconventionmaplookupnc,var.location),var.entity,"SUB",var.enviornment,lookup(var.public_subnet_definition[count.index],"subnet_identifier"))}"
  virtual_network_name = "${format("%s-%s-%s-%s-%s",lookup(var.regionnamingconventionmaplookupnc,var.location),var.entity,"VNT",var.enviornment,lookup(var.public_subnet_definition[count.index],"vnet_identifier"))}"
  resource_group_name  = "${var.resource_group}"
  address_prefix       = "${lookup(var.public_subnet_definition[count.index],"subnet_CIDR")}"
}

resource "azurerm_subnet" "gateway_subnet" {
  depends_on = ["azurerm_virtual_network.vnet"]
  count = "${length(var.gateway_subnet_definition)}"
  name                        = "GatewaySubnet"
  virtual_network_name = "${format("%s-%s-%s-%s-%s",lookup(var.regionnamingconventionmaplookupnc,var.location),var.entity,"VNT",var.enviornment,lookup(var.gateway_subnet_definition[count.index],"vnet_identifier"))}"
  resource_group_name         = "${var.resource_group}"
  address_prefix              = "${lookup(var.gateway_subnet_definition[count.index],"subnet_CIDR")}"
}

resource "azurerm_subnet" "private_subnet" {
  count = "${length(var.private_subnet_definition)}"

  name                        = "${format("%s-%s-%s-%s-%s",lookup(var.regionnamingconventionmaplookupnc,var.location),var.entity,"SUB",var.enviornment,lookup(var.private_subnet_definition[count.index],"subnet_identifier"))}"
  virtual_network_name        = "${format("%s-%s-%s-%s-%s",lookup(var.regionnamingconventionmaplookupnc,var.location),var.entity,"VNT",var.enviornment,lookup(var.private_subnet_definition[count.index],"vnet_identifier"))}"
  resource_group_name         = "${var.resource_group}"
  address_prefix              = "${lookup(var.private_subnet_definition[count.index],"subnet_CIDR")}"
  network_security_group_id   = "${azurerm_network_security_group.nsg_denyInternet.id}"
  service_endpoints           = ["${lookup(var.private_subnet_definition[count.index],"service_endpoints")}"]
}

resource "azurerm_subnet_network_security_group_association" "private_subnet_GK_NSG" {
  count = "${length(var.private_subnet_definition)}"
  subnet_id                 = "${azurerm_subnet.private_subnet.*.id[count.index]}"
  network_security_group_id = "${azurerm_network_security_group.nsg_denyInternet.id}"
}

resource "azurerm_network_security_group" "nsg_denyInternet" {
  count = "1"
  name                = "${format("%s-%s-%s-%s-%s",lookup(var.regionnamingconventionmaplookupnc,var.location),var.entity,"NSG",var.enviornment,"GK")}"
  location            = "${var.location}"
  resource_group_name = "${var.resource_group}"
  tags                 = "${var.tags}"
}