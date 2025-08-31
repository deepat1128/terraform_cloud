provider "azurerm" {
  features {}
  subscription_id = "65c37065-d316-4ed3-a720-cc0c3872ac3a"
}

terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 4.42.0"
    }
  }
}
