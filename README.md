# Cardano JSON:API

A [JSON:API](https://jsonapi.org/)-compliant REST API for the
[Cardano](https://cardano.org/) blockchain built with Crystal and Lucky
Framework.

## Important
This project is nowhere near ready for use. Some parts will be extracted into
different shards, like an ORM mapping extension for Avram.

## Introduction
This is a fully self-hosted API for Cardano, including cardano-node,
[cardano-db-sync](https://github.com/input-output-hk/cardano-db-sync) and a
Postgres database containing a copy of the blockchain. It also includes IPFS 
endpoints to upload and retreive files.

## Usage
On a server with `docker` and `docker-compose` installed, run:

```bash
sudo docker-compose up -d
```

To follow the logs:

```bash
sudo docker-compose logs -f
```

## System requirements
- Any of the big well known Linux distributions (eg, Debian, Ubuntu, RHEL, CentOS, Arch etc)
- 24 Gigabytes of RAM
- 4 CPU cores
- 80 Gigabytes or more of disk storage (preferably SSD which are 2-5 times faster than electro-mechanical disks)

### Setting up the project
TO-DO

### Learning Lucky
Lucky uses the [Crystal](https://crystal-lang.org) programming language. You can
learn about Lucky from the
[Lucky Guides](https://luckyframework.org/guides/getting-started/why-lucky).
