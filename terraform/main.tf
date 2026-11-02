resource "azurerm_resource_group" "resource_grp" {

  name     = var.resource_group_name
  location = var.primary_location
  tags = {
    project     = var.project_name
    environment = "dev"
    managed_by  = "terraform"
  }
}

moved {
  from = azurerm_resource_group.this
  to   = azurerm_resource_group.resource_grp
}