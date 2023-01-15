defmodule WeatherScraper.Postgres.Repo do
  use Ecto.Repo,
    otp_app: :weather_scraper,
    adapter: Ecto.Adapters.Postgres
end
