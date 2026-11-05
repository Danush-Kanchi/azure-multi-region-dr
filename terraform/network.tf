resource "azurerm_virtual_network" "primary" {
  name                = "${var.project_name}-vnet-primary"
  location            = var.primary_location
  resource_group_name = azurerm_resource_group.resource_grp.name
  address_space       = ["10.10.0.0/16"]
}

resource "azurerm_subnet" "primary" {
  name                 = "app-subnet-primary"
  resource_group_name  = azurerm_resource_group.resource_grp.name
  virtual_network_name = azurerm_virtual_network.primary.name
  address_prefixes     = ["10.10.1.0/24"]
}

resource "azurerm_virtual_network" "secondary" {
  name                = "${var.project_name}-vnet-secondary"
  location            = var.secondary_location
  resource_group_name = azurerm_resource_group.resource_grp.name
  address_space       = ["10.20.0.0/16"]
}

resource "azurerm_subnet" "secondary" {
  name                 = "app-subnet-secondary"
  resource_group_name  = azurerm_resource_group.resource_grp.name
  virtual_network_name = azurerm_virtual_network.secondary.name
  address_prefixes     = ["10.20.1.0/24"]
}