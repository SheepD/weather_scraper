import Config

config :mix_test_watch, clear: true

config :weather_scraper, ecto_repos: [WeatherScraper.Repo]

config :weather_scraper, WeatherScraper.Repo,
  database: System.get_env("POSTGRES_DBNAME", "weather_scraper_dev"),
  hostname: System.get_env("POSTGRES_HOSTNAME", "postgres"),
  username: System.get_env("POSTGRES_USERNAME", "postgres"),
  password: System.get_env("POSTGRES_PASSWORD", "postgres"),
  pool_size: 10

import_config "#{config_env()}.exs"
