terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 3.0"
    }
    random = {
      source  = "hashicorp/random"
      version = "~> 3.0"
    }
  }
}

provider "azurerm" {
  features {}
}

# Random suffix for uniqueness
resource "random_integer" "suffix" {
  min = 10000
  max = 99999
}

# Resource group
resource "azurerm_resource_group" "rg" {
  name     = "employee-rg"
  location = "East US"
}

# Container group (frontend)
resource "azurerm_container_group" "frontend" {
  name                = "employee-frontend-${random_integer.suffix.result}"
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
  os_type             = "Linux"

  container {
    name  = "frontend"
    image = "eshakhan2k22/employee-frontend:v1"
    cpu   = 0.5
    memory = 1.5
    ports {
        port = 80
        protocol = "TCP"
    }
}

  ip_address_type = "Public"
  dns_name_label  = "employee-frontend-${random_integer.suffix.result}"
}
