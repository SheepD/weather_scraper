defmodule WeatherScraper do
  @moduledoc """
  Documentation for WeatherScraper.
  """
  use Application

  def start(_type, _args) do
    Envy.auto_load
    WeatherScraper.Supervisor.start_link(name: WeatherScraper.Supervisor)
  end
end
