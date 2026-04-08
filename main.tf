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

resource "snowflake_database" "demo_db" {
  name = "DEMO_DB"
}