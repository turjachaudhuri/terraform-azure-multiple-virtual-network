module "vnet-example" {
  source = "../../" # Location of the module

  app_identifier =  "${var.app_identifier}"

  regionnamingconventionmaplookupnc = "${var.regionnamingconventionmaplookupnc}"
  regionnamingconventionmaplookup   = "${var.regionnamingconventionmaplookup}"

  entity         = "${var.entity}"
  resource_group = "${var.rg}"
  location       = "${var.location}"
  enviornment    = "${var.enviornment}"
  dns_map        = "${var.dns_map}"
  vnet_definition = "${var.vnet_definition}"
  tags = "${var.tags}"
  public_subnet_definition      = "${var.public_subnet_definition}"
  private_subnet_definition     = "${var.private_subnet_definition}"
  gateway_subnet_definition     = "${var.gateway_subnet_definition}"
}