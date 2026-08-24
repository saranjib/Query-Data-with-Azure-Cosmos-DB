resource "azurerm_resource_group" "rg-cosmos-query-lab" {
  name     = var.resource_group_name
  location = var.location
}
