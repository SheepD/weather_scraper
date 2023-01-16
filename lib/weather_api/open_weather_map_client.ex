defmodule WeatherScraper.WeatherApi.OpenWeatherMapClient do
  @moduledoc """
  Weather API implementation for Open Weather Map API
  """

  use HTTPoison.Base

  alias WeatherScraper.WeatherApi
  alias WeatherScraper.Weather

  @behaviour WeatherApi

  @impl true
  def process_url(url) do
    uri = "#{base_url()}/#{url}&APPID=#{api_key()}"

    URI.encode(uri)
  end

  @impl true
  def process_response_body(body) do
    case Poison.decode(body) do
      {:ok, body} -> {:ok, body}
      {:error, _err} -> {:error, :invalid_json}
    end
  end

  @impl WeatherApi
  def fetch_weather() do
    with {:ok, %{body: %{"name" => name, "main" => main}}} <-
          get("/weather?q=Manila") do
      main
      |> Map.merge(%{ "name" => name })
      |> format_response()
    else
      {:ok, _} -> {:error, :invalid_request}
      map when is_map(map) -> {:error, :failed_to_parse}
      error -> error
    end
  end

  @impl WeatherApi
  def format_response(
    %{
      "name" => name,
      "temp_min" => temp_min,
      "temp_max" => temp_max,
      "humidity" => humidity,
      "pressure" => pressure
    }) do
    {
      :ok,
      %Weather{
        city: name,
        temp_min: temp_min,
        temp_max: temp_max,
        humidity: humidity,
        pressure: pressure,
        time: DateTime.utc_now()
      }
    }
  end

  defp base_url, do: Application.fetch_env!(:open_weather_map, :base_url)
  defp api_key, do: Application.fetch_env!(:open_weather_map, :api_key)
end
