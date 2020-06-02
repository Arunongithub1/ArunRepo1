provider "azurerm" {
  # The "feature" block is required for AzureRM provider 2.x. 
  # If you are using version 1.x, the "features" block is not allowed.
  version = "~>2.0"
  features {}
}
# Create a resource group
resource "azurerm_resource_group" "example" {
  name     = "RG-INF-UKS"
  location = "UK South"
  tags = {
        environment = "Terraform Demo"
    department = "Infrastructure Dept"
    }
}
resource "azurerm_virtual_network" "myterraformnetwork" {
    name                = "INF-UKS-VNET"
    address_space       = ["10.250.0.0/21"]
    location            = "uk south"
    resource_group_name = "RG-INF-UKS"

    tags = {
        environment = "Terraform Demo"
    }
}
# Where are my changes!
# Hello
# Test


# Create a resource group
resource "azurerm_resource_group" "example1" {
  name     = "RG-DEV-UKS"
  location = "UK South"
  tags = {
        environment = "Terraform Demo"
    department = "Dev Dept"
    }
}
resource "azurerm_virtual_network" "myterraformnetwork1" {
    name                = "DEV-UKS-VNET"
    address_space       = ["10.250.8.0/21"]
    location            = "uk south"
    resource_group_name = "RG-DEV-UKS"

    tags = {
        environment = "Terraform Demo"
    }
}
resource "azurerm_route_table" "example2" {
  name                          = "InfrastructureRT"
  location                      = "uk south"
  resource_group_name           = "RG-INF-UKS"
  disable_bgp_route_propagation = false

  route {
    name           = "route1"
    address_prefix = "10.250.9.0/21"
    next_hop_type  = "vnetlocal"
  }

  tags = {
    environment = "Production"
  }
}
