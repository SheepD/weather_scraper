use Mix.Config

config :mix_test_watch, clear: true

config :weather_scraper, ecto_repos: [WeatherScraper.Repo]

config :weather_scraper, WeatherScraper.Repo,
  database: "weather_scraper_dev",
  hostname: "localhost",
  pool_size: 10

# It is also possible to import configuration files, relative to this
# directory. For example, you can emulate configuration per environment
# by uncommenting the line below and defining dev.exs, test.exs and such.
# Configuration from the imported file will override the ones defined
# here (which is why it is important to import them last).
#
#     import_config "#{Mix.env()}.exs"
