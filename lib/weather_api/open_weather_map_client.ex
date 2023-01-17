defmodule WeatherScraper.WeatherApi.OpenWeatherMapClient do
  @moduledoc """
  Weather API implementation for Open Weather Map API
  """

  use HTTPoison.Base

  alias WeatherScraper.{Weather, WeatherApi, Repo}

  @behaviour WeatherApi

  @expected_fields ~w(temp_min temp_max humidity pressure)

  @impl true
  def process_request_url(url) do
    uri = "#{base_url()}#{url}&appid=#{api_key()}"

    URI.encode(uri)
  end

  @impl true
  def process_response_body(body) do
    with parsed_body <- Poison.decode!(body),
         {:ok, city} <- Map.fetch(parsed_body, "name"),
         {:ok, temp_data} <- Map.fetch(parsed_body, "main") do
      temp_data
      |> Map.take(@expected_fields)
      |> Map.new(fn {k, v} -> {String.to_atom(k), v} end)
      |> Map.merge(%{city: city, time: DateTime.utc_now()})
    else
      error -> error
    end
  end

  @impl WeatherApi
  def fetch_weather(location) do
    with {:ok, %{body: params}} <- get("/weather?q=#{location}") do
      weather =
        %Weather{}
        |> Weather.changeset(params)
        |> Repo.insert()

      {:ok, weather}
    else
      {:ok, _} -> {:error, :invalid_request}
      error -> {:error, error}
    end
  end

  defp base_url, do: Application.fetch_env!(:weather_scraper, :open_weather_map_base_url)
  defp api_key, do: Application.fetch_env!(:weather_scraper, :open_weather_map_api_key)
end
