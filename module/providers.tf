terraform {
  required_providers {
    azuredevops = {
      source  = "microsoft/azuredevops"
      version = "~> 1.0"
    }
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 3.79"
    }
  }

  required_version = "~> 1.3.9" #"~> 1.6"
}

provider "azurerm" {
  features {}
}

provider "azuredevops" {
  personal_access_token = var.adotoken_VV
  org_service_url       = var.organization_service_url_VV
}