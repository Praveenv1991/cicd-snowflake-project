terraform {
  required_providers {
    snowflake = {
      source  = "snowflakedb/snowflake"
      version = "~> 1.0"
    }
  }
}

provider "snowflake" {
  organization_name        = "QNNPHFX"
  account_name             = "WN06484"
  user                     = var.username
  password                 = var.password
  role                     = "ACCOUNTADMIN"
  preview_features_enabled = ["snowflake_table_resource"]
}

variable "username" {
  type = string
}

variable "password" {
  type      = string
  sensitive = true
}

variable "database_name" {
  type = string
}

variable "table_name" {
  type = string
}

resource "snowflake_database" "demo_db" {
  name = var.database_name
}

resource "snowflake_table" "customer_table" {
  database = snowflake_database.demo_db.name
  schema   = "PUBLIC"
  name     = var.table_name

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