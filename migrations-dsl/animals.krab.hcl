migration "create_categories" {
  version = "v1"

  up {
    create_table "categories" {
      column "id" "bigint" {}
      column "name" "varchar" { null = false }

      primary_key { columns = ["id"] }
    }
  }

  down {
    drop_table "categories" {}
  }
}

migration "create_animals" {
  version = "v2"

  up {
    create_table "animals" {
      column "id" "bigint" {
        identity {}
      }

      column "name" "varchar" { null = true }

      column "extinct" "boolean" {
        null    = false
        default = "TRUE"
      }

      column "weight_kg" "int" { null = false }

      column "weight_g" "int" {
        generated {
          as = "weight_kg * 1000"
        }
      }

      column "category_id" "bigint" {
        null = false
      }

      unique {
        columns = ["name"]
        include = ["weight_kg"]
      }

      primary_key {
        columns = ["id"]
      }

      check "ensure_positive_weight" {
        expression = "weight_kg > 0"
      }

      foreign_key {
        columns = ["category_id"]

        references "categories" {
          columns = ["id"]

          on_delete = "cascade"
          on_update = "cascade"
        }
      }
    }
  }

  down {
    drop_table "animals" {}
  }
}

migration_set "animals" {
  migrations = [
    migration.create_categories,
    migration.create_animals
  ]
}
