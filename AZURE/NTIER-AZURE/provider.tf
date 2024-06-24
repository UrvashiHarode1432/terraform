terraform {
  required_providers {
    #azurerm version constraints
    azurerm = {
      source  = "hashicorp/azurerm"
      version = ">=3.0.0"
    }
  }
  #terraform version constraints
  required_version = ">= 1.5.0"
}

provider "azurerm" {
  features {

  }
}