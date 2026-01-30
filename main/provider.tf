terraform {
  required_providers {
    azurerm = {
        source = "hashicorp/azurerm"
        version = "4.45.0"
    }
  }
  backend "azurerm" {
    resource_group_name = "mademi-rg"
    storage_account_name = "mademistg"
    container_name = "mademicontainer"
    key = "infra1.mademi.tfstate"
  }
}

provider "azurerm" {
  features {}
  subscription_id = "99a2d563-027d-4106-9794-b39cdcc42ba6"
}