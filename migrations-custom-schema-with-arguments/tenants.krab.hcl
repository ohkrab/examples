migration "tenant_create_users" {
  version = "v1"

  up { sql = "CREATE TABLE users(name VARCHAR)" }
  down { sql = "DROP TABLE users" }
}

migration_set "tenants" {
  arguments {
    arg "name" {
      description = "Schema suffix for tenant"
    }
  }

  schema = "tenant_{{ .Args.name }}"

  migrations = [migration.tenant_create_users]
}
