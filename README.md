# Examples

## Setup

1. Install krab

https://ohkrab.dev/docs/get_started/installation/

2. Spin up test database and db browser

```
docker-compose up
```

Browser can be accessed at: http://localhost:5556/

3. Export database url

```
export DATABASE_URL=postgres://krab:secret@localhost:5555/krab?sslmode=disable
```

## Run example

1. Export dir with example

```
export KRAB_DIR=migrations-simple/
```

2. Run a command

```
krab
```

3. Try other commands

```
krab migrate up animals
krab migrate status animals
krab migrate down animals -version v1
krab migrate status animals
```
