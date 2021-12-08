migration "create_humans" {
  version = "v1"

  up { sql = "CREATE TABLE humans(name VARCHAR)" }
  down { sql = "DROP TABLE humans" }
}

migration_set "humans" {
  schema = "humans"

  migrations = [migration.create_humans]
}
