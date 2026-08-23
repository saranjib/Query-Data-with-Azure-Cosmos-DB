# Query Data with Azure Cosmos-DB
A hands-on Azure cloud project that demonstrates how to provision Azure Cosmos DB using Terraform and perform CRUD operations and SQL-style queries using Python.

# Architecture


## Project structure

```text
query-data-with-azure-cosmos-db/
├── app/
│   ├── cosmos_client.py
│   ├── crud.py
│   ├── queries.py
│   └── main.py
├── tests/
│   └── test_queries.py
├── terraform/
│   ├── main.tf
│   ├── variables.tf
│   ├── outputs.tf
│   ├── versions.tf
│   └── terraform.tfvars.example
├── .github/
│   └── workflows/
│       └── ci.yml
├── .gitignore
├── requirements.txt
└── README.md
```

