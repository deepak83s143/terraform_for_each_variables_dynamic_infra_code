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
  subscription_id = "9bea01e4-55e4-402f-89cb-b4fe92c3bd2c"
}