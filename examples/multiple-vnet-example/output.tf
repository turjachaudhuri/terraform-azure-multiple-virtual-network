###############################
## Terraform VNET deployment ##
## ------------------------- ##
## OUTPUT DATA CONFIGURATION ##
###############################

### The purpose of this file is to define the specify what data,
### returned by modules, are stored to to be reused

### All this data MUST BE returned and configured in modules ###

output "virtual_network_name" { # Entity virtual network name
    value = "${module.vnet.virtual_network_name}"
}
