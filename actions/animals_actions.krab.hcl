action "animals" "refresh" {
  sql = "REFRESH MATERIALIZED VIEW cached_animals"
}

action "animals" "insert" {
  arguments {
    arg "name" {
      description = "Animal name to insert"
    }
  }

  sql = "INSERT INTO animals (name) VALUES ({{ .Args.name | quote }})"
}
