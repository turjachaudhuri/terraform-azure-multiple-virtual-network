terraform {
  required_version = ">= 0.11"

  required_providers {
    aws = {
      source  = "hashicorp/azurerm"
      version = ">= 1.22"
    }
    null = {
      source = "hashicorp/null"
      version = ">=0.1"
    }
  }
}