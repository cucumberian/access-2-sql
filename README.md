# Access database to sql via Docker-container

## Description

Converting access database into sql

## Install

Build docker image

```sh
docker build --tag access2sql .
```

## Usage

Run docker image and connect database file via volume

```sh
docker run --rm -v "$./accessDir/:/data/" access2sql myDatabase.accdb > output.sql
```

or with output database type

```sh
docker run --rm -v "$./accessDir/:/data/" access2sql myDatabase.accdb mysql > output.sql
```

### Where

- `./accessDir/` - directory with access database
- `myDatabase.accdb` - access database
- `output.sql` - result file with sql commands
- `mysql` - format for dump (default: `postgres`)