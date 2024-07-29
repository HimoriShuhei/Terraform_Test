terraform {
  required_version = ">=0.12"
  
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = ">=2.46.0"
    }
  }
}

provider "azurerm" {
  features {}
}

variable "resource_group_location" {
  default = "ap-northeast-1"
}

locals {
  common_tags = {
    owner  = "terraformTest"
    period = "20240831"
  }
}

resource "azurerm_resource_group" "rg" {
  name     = "rg-terraformtest-resources"
  location = var.resource_group_location

  tags = local.common_tags
}

resource "azurerm_virtual_network" "vnet" {
  name                = "terraformtestvnet"
  address_space       = ["10.0.0.0/16"]
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name

  tags = local.common_tags
}
