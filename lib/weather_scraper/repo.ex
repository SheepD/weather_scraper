defmodule WeatherScraper.Repo do
  @moduledoc """
  Module for the Postgres Repo of the Application
  """

  use Ecto.Repo,
    otp_app: :weather_scraper,
    adapter: Ecto.Adapters.Postgres
end
