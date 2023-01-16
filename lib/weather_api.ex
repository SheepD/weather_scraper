defmodule WeatherScraper.WeatherApi do
  @moduledoc """
  Behaviour for Weather APIs use in this project
  """

  @callback fetch_weather() :: {:ok, map()} | {:error, String.t()}

  def fetch_weather do
    api_client().get_entries()
  end

  defp api_client, do: Application.fetch_env!(:weather_scraper, :weather_api_client)
end
