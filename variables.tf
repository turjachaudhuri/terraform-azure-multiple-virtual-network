variable "app_identifier" {
  description = "Default name to use with your resource names."
}

variable "location" {
  description = "The location/region where the core network will be created. The full list of Azure regions can be found at https://azure.microsoft.com/regions"
}

variable "entity" {
  description = "name of the entity"
}

variable "enviornment" {
  description = "define the enviornment - PROD / DEV"
}

variable "resource_group" {
  description = "name of the resource group"
}

variable "regionnamingconventionmaplookup" {
  description = "mapping between the aws regions and client region names"
}

variable "regionnamingconventionmaplookupnc" {
  description = "mapping between the aws regions and client region names naming convention"
}

variable "vnet_definition"{
  type = "list"
}

variable "tags" {
    type = "map"
}

variable "public_subnet_definition"{
  type="list"
}

variable "private_subnet_definition"{
  type="list"
}

variable "gateway_subnet_definition"{
  type="list"
}

variable "dns_map"{
  type = "map"
}