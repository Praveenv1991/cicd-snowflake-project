terraform {
  required_providers {
    snowflake = {
      source  = "Snowflake-Labs/snowflake"
      version = "~> 0.98"
    }
  }
}

provider "snowflake" {
  account  = "QNNPHFX-WN06484"
  username = "PRAVEENV"
  password = "Advaith@202666"
  role     = "ACCOUNTADMIN"
}

resource "snowflake_database" "demo_db" {
  name = "DEMO_DB"
}