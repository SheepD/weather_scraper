defmodule WeatherScraper do
  @moduledoc """
  Documentation for WeatherScraper.
  """
  use Application

  def start(_type, _args) do
    WeatherScraper.Supervisor.start_link(name: WeatherScraper.Supervisor)
  end
end
