defmodule WeatherScraper.WeatherApi do
  @moduledoc """
  Behaviour for Weather APIs use in this project
  """

  @callback fetch_weather() :: {:ok, map()} | {:error, String.t()}

  @callback format_response(map()) :: {:ok, map()} | {:error, String.t()}
end
