migration "create_animals" {
  version = "v1"

  up { sql = "CREATE TABLE animals(name VARCHAR)" }
  down { sql = "DROP TABLE animals" }
}

migration "create_animals_view" {
  version = "v2"

  up { sql = "CREATE MATERIALIZED VIEW cached_animals AS SELECT name FROM animals" }
  down { sql = "DROP MATERIALIZED VIEW cached_animals" }
}

migration_set "animals" {
  migrations = [
    migration.create_animals,
    migration.create_animals_view,
  ]
}
