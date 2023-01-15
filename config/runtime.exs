import Config

if Enum.member?(~w(prod staging)a, config_env()) do
  config :weather_scraper, WeatherScraper.Repo,
    database: System.fetch_env!("POSTGRES_DBNAME"),
    hostname: System.fetch_env!("POSTGRES_HOSTNAME"),
    username: System.fetch_env!("POSTGRES_USERNAME"),
    password: System.fetch_env!("POSTGRES_PASSWORD")

  config :weather_scraper,
    open_weather_map_api_key: System.fetch_env!("OPEN_WEATHER_MAP_API_KEY")
end
