# README

## Docker-based workflow
* Install docker and docker compose

* To install or update gems: `docker-compose up bundler`
* To run the console: `docker-compose run --rm console`
* To run guard for TDD: `docker-compose run guard`
* To run rails commands (e.g. migrations): `docker-compose run web rails db:migrate`
