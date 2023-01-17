# WeatherScraper

This is a simple app that scrapes weather data from [open weather map](https://openweathermap.org) with a `GenServer` scheduler then persists the temperature data into the database with `Ecto`

## Requirements

* Elixir 1.13+
* Erlang OTP 25
* PostgreSQL

## Getting Started

### Docker

* setup the required env variables via `cp .env.example .env`
* `docker-compose up`

### Without Docker

* setup the required env variables via `cp .env.example .env`
* `mix deps.get`
* `mix ecto.create`
* `mix ecto.migrate`
* `mix run --no-halt`

## Room for improvement

* configure Github CI & Linters (i.e Dialyzer, Credo)
* improve test coverage
* update typespecs
* add additional weather clients
* improve handling of failure scenarios for weather clients (i.e. throttling)
* improve weather scraper to allow data collection from multiple locations
