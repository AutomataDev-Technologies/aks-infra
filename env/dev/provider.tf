terraform {
  backend "azurerm" {
    resource_group_name = "satya-rg"
    storage_account_name = "satyastoghf"
    container_name = "container"
    key = "dev.terraform.tfstate"
  }
  required_providers {
    azurerm = {
      source = "hashicorp/azurerm"
      version = "4.57.0"
    }
  }
}

provider "azurerm" {
 features {}
 subscription_id = "86dc31e5-df0c-4c2c-9818-568d4d373fa6"
}



