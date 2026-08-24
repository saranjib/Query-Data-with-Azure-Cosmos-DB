resource "azurerm_resource_group" "rg-cosmos-query-lab" {
  name     = var.resource_group_name
  location = var.location
}

resource "azurerm_cosmosdb_account" "rg-cosmos-query_account" {
  name                = var.cosmos_account_name
  location            = azurerm_resource_group.rg-cosmos-query-lab.location
  resource_group_name = azurerm_resource_group.rg-cosmos-query-lab.name

  offer_type = "Standard"
  kind       = "GlobalDocumentDB"

  public_network_access_enabled = true

  consistency_policy {
    consistency_level = "Session"
  }

  geo_location {
    location          = azurerm_resource_group.rg-cosmos-query-lab.location
    failover_priority = 0
  }

  automatic_failover_enabled = false
}
