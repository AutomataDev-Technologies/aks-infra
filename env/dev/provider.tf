terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "4.51.0"
    }

    # azuread = {
    #   source  = "hashicorp/azuread"
    #   version = "3.7.0"
    # }
  }


}

provider "azurerm" {
  features {}

  subscription_id = "b4461466-1e6b-4be2-bb70-1e96a72a41c8"
}

# provider "azuread" {
  
# }
