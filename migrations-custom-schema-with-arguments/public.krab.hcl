migration "create_tenants" {
  version = "20201208-tenants"

  up {
    create_table "tenants" {
      column "id" "bigint" {
        identity {}
      }

      column "name" "varchar" { null = false }

      primary_key { columns = ["id"] }
    }
  }

  down {
    drop_table "tenants" {}
  }
}

migration_set "public" {
  migrations = [migration.create_tenants]
}
