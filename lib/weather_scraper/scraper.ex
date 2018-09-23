defmodule WeatherScraper.Scraper do
  use HTTPoison.Base

  def process_url(url) do
    "api.openweathermap.org/data/2.5" <>
      url <>
      "&APPID=#{System.get_env("OPEN_WEATHER_MAP_API_KEY")}"
  end

  def process_response_body(body) do
    body
    |> Poison.decode!
  end
end
