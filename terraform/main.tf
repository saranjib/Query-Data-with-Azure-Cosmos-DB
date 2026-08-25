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

resource "azurerm_cosmosdb_sql_database" "rg-cosmos-query_db" {
  name                = var.database_name
  resource_group_name = azurerm_resource_group.rg-cosmos-query-lab.name
  account_name        = azurerm_cosmosdb_account.rg-cosmos-query-account.name
}

resource "azurerm_cosmosdb_sql_container" "rg-cosmos-query_container" {
  name                  = var.container_name
  resource_group_name   = azurerm_resource_group.rg-cosmos-query-lab.name
  account_name          = azurerm_cosmosdb_account.rg-cosmos-query-account.name
  database_name         = azurerm_cosmosdb_sql_database.rg-cosmos-query-db.name
  partition_key_paths   = ["/category"]
  partition_key_version = 2

  indexing_policy {
    indexing_mode = "consistent"
  }
}
