import Config

config :logger, level: :warn

config :weather_scraper, WeatherScraper.Repo,
  pool: Ecto.Adapters.SQL.Sandbox,
  database: "weather_scraper_test"
