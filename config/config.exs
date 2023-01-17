import Config

alias WeatherScraper.Repo
alias WeatherScraper.WeatherApi.OpenWeatherMapClient

config :mix_test_watch, clear: true

config :weather_scraper,
  ecto_repos: [Repo],
  poll_interval: System.get_env("POLL_INTERVAL", "5"),
  weather_api_client: OpenWeatherMapClient,
  location: "Berlin",
  open_weather_map_api_key: System.get_env("OPEN_WEATHER_MAP_API_KEY", "test"),
  open_weather_map_base_url: System.get_env("OPEN_WEATHER_MAP_BASE_URL", "api.openweathermap.org/data/2.5")

config :weather_scraper, Repo,
  database: System.get_env("POSTGRES_DBNAME", "weather_scraper_dev"),
  hostname: System.get_env("POSTGRES_HOSTNAME", "postgres"),
  username: System.get_env("POSTGRES_USERNAME", "postgres"),
  password: System.get_env("POSTGRES_PASSWORD", "postgres"),
  pool_size: 10

import_config "#{config_env()}.exs"
