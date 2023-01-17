defmodule WeatherScraper.Scraper do
  @moduledoc """
  GenServer to handle Scheduled Scraping of weather information
  """

  use GenServer

  alias WeatherScraper.WeatherApi

  # Client
  def start_link(opts) do
    GenServer.start_link(__MODULE__, opts)
  end

  # Server
  def init(state) do
    schedule_work()

    {:ok, state}
  end

  @impl true
  def handle_info(:fetch_weather_data, state) do
    Task.async(fn -> WeatherApi.fetch_weather() end)

    schedule_work()

    {:noreply, state}
  end

  defp schedule_work(), do: Process.send_after(self(), :fetch_weather_data, interval() * 1000)

  defp interval,
    do: Application.fetch_env!(:weather_scraper, :poll_interval) |> String.to_integer()
end
