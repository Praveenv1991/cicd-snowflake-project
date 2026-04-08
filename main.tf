terraform {
  required_providers {
    snowflake = {
      source  = "snowflakedb/snowflake"
      version = "~> 1.0"
    }
  }
}

provider "snowflake" {
  organization_name = "QNNPHFX"
  account_name      = "WN06484"
  user              = var.username
  password          = var.password
  role              = "ACCOUNTADMIN"
}

variable "account" {
  type = string
}

variable "username" {
  type = string
}

variable "password" {
  type      = string
  sensitive = true
}

# ✅ Database
resource "snowflake_database" "demo_db" {
  name = "DEMO_DB_V2"
}

# ✅ Table (NO schema resource, use PUBLIC directly)
resource "snowflake_table" "customer_table" {
  database = snowflake_database.demo_db.name
  schema   = "PUBLIC"
  name     = "CUSTOMERS"

  column {
    name = "ID"
    type = "NUMBER"
  }

  column {
    name = "NAME"
    type = "VARCHAR"
  }

  column {
    name = "CITY"
    type = "VARCHAR"
  }
}