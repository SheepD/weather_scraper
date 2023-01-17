defmodule WeatherScraper.WeatherApi do
  @moduledoc """
  Behaviour for Weather APIs use in this project
  """

  @callback fetch_weather(String.t()) :: {:ok, map()} | {:error, String.t()}

  def fetch_weather do
    api_client().get_entries(location())
  end

  defp api_client, do: Application.fetch_env!(:weather_scraper, :weather_api_client)
  defp location, do: Application.fetch_env(:weather_scraper, :location)
end
