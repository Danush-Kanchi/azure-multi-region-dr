variable "database_name" {
  default = "myappdb"
}

variable "subscription_id" {
  description = "Azure subscription ID used for this deployment"
  type        = string
}

variable "project_name" {

  description = "map the resources to a project name"
  type        = string
  default     = "azure-multi-region-dr"
}

variable "resource_group_name" {
  description = "Name of the resource group containing the DR platform"
  type        = string
  default     = "azure-multi-region-dr-rg"
}

variable "primary_location" {
  description = "Azure region for the primary infrastructure resources"
  type        = string
  default     = "East US"
}

variable "secondary_location" {
  description = "Azure region for the secondary infrastructure"
  type        = string
  default     = "West US 2"
}

resource "azurerm_network_security_group" "primary" {
  name                = "${var.project_name}-nsg-primary"
  location            = var.primary_location
  resource_group_name = azurerm_resource_group.resource_grp.name

  security_rule {
    name                       = "allow-http"
    priority                   = 100
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "80"
    source_address_prefix      = "Internet"
    destination_address_prefix = "*"
  }
}

resource "azurerm_subnet_network_security_group_association" "primary" {
  subnet_id                 = azurerm_subnet.primary.id
  network_security_group_id = azurerm_network_security_group.primary.id
}

resource "azurerm_network_security_group" "secondary" {
  name                = "${var.project_name}-nsg-secondary"
  location            = var.secondary_location
  resource_group_name = azurerm_resource_group.resource_grp.name

  security_rule {
    name                       = "allow-http"
    priority                   = 100
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "80"
    source_address_prefix      = "Internet"
    destination_address_prefix = "*"
  }
}

resource "azurerm_subnet_network_security_group_association" "secondary" {
  subnet_id                 = azurerm_subnet.secondary.id
  network_security_group_id = azurerm_network_security_group.secondary.id
}