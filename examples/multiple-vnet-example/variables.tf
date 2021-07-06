variable "app_identifier" {
  description = "Default name to use with your resource names."
  default     = "MODULEVNETTEST"
}

variable "location" {
  description = "The location/region where the core network will be created. The full list of Azure regions can be found at https://azure.microsoft.com/regions"
  default     = "southeastasia"
}

variable "entity" {
  description = "name of the entity"
  default     = "APAC"
}

variable "enviornment" {
  description = "define the enviornment - PROD / DEV"
  default     = "QA"
}

variable "resource_group" {
  description = "name of the resource group"
  default     = "TerraformModuleTestRG"
}

variable "regionnamingconventionmaplookup" {
  description = "mapping between the aws regions and client region names"
  default     = {
    southeastasia = "apac"
    eastasia      = "apac"
    northeurope   = "emea"
    westeurope    = "emea"
    eastus        = "amer"
    australiasoutheast = "apac"
}
}

variable "regionnamingconventionmaplookupnc" {
  description = "mapping between the aws regions and client region names naming convention"
  default     = {
    southeastasia = "SA"
    eastasia      = "EA"
    northeurope   = "NE"
    westeurope    = "WE"
    eastus        = "EU"
    australiasoutheast = "AS"
}
}

variable "vnet_definition"{
  type = "list"
  default = [
  {
      vnet_identifier =   "VNT1"
      vnet_CIDR   = "10.0.0.0/16"
  }
  ]
}

variable "tags" {
    type = "map"
    default =  {
    Key1 = "Value1"
    Key2 = "Value2"
  }
}

variable "public_subnet_definition"{
  type="list"
  default = [
  {
      subnet_identifier =  "PUBLIC1",
      vnet_identifier = "VNT1",
      subnet_CIDR   = "10.0.0.0/24",
      subnet_type = "public"
  }
]
}

variable "private_subnet_definition"{
  type="list"
  default = [
    # Subnet for Web/App servers
    {
      subnet_identifier =   "PRIVATE1",
      vnet_identifier = "VNT1",
      subnet_CIDR   = "10.0.1.0/24",
      subnet_type = "private",
      service_endpoints = "Microsoft.Storage"
    }    
  ]
}

variable "gateway_subnet_definition"{
  type="list"
  default = []
}

variable "dns_map"{
  type = "map"
  default =  {
    southeastasia = "10.0.0.4,10.0.0.5"
    eastasia      = "10.0.63.4,10.0.63.5"
    westeurope    = "10.0.29.224,10.0.29.133"
    northeurope   = "10.0.176.224,10.0.176.133"
    eastus        = "10.0.84.224,10.0.84.133"
    westus        = "10.0.84.136,10.0.84.137"
    australiasoutheast = "10.0.0.4,10.0.0.5"
}
}