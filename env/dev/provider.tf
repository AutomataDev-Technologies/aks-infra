terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "4.51.0"
    }
}
}

provider "azurerm" {
  features {}

  subscription_id = "86dc31e5-df0c-4c2c-9818-568d4d373fa6"
}



