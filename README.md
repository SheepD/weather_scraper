# WeatherScraper

This is a simple app that scrapes weather data from [open weather map](https://openweathermap.org) with a `GenServer` scheduler then persists the temperature data into the database with `Ecto`

## Requirements

* Elixir 1.7+
* PostgreSQL

## Setup

* setup the required env variables via `cp .env.something .env`
* `mix deps.get`
* `mix ecto.create`
* `mix run`
