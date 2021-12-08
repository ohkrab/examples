migration "create_animals" {
  version = "v1"

  up { sql = "CREATE TABLE animals(name VARCHAR)" }
  down { sql = "DROP TABLE animals" }
}

migration_set "animals" {
  schema = "animals"

  migrations = [migration.create_animals]
}
