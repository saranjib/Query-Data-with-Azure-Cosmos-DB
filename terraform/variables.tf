variable "location" {
  description = "Azure region"
  type        = string
  default     = "centralindia"
}

variable "resource_group_name" {
  description = "Resource group name"
  type        = string
  default     = "rg-cosmos-query-lab"
}

variable "cosmos_account_name" {
  description = "Globally unique Cosmos DB account name"
  type        = string
}

variable "database_name" {
  description = "Cosmos DB SQL database name"
  type        = string
  default     = "rg-cosmos-query_db"
}
