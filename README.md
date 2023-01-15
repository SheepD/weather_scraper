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

## To open the console

`iex -S mix`
