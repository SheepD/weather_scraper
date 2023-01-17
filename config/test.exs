import Config

config :logger, level: :warn

config :weather_scraper, WeatherScraper.Repo,
  pool: Ecto.Adapters.SQL.Sandbox,
  database: "weather_scraper_test"

config :weather_scraper,
  open_weather_map_api_key: "test",
  poll_interval: "1"
