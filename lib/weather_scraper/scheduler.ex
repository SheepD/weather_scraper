defmodule WeatherScraper.Scheduler do
  use GenServer

  # Client

  def start_link(opts) do
    GenServer.start_link(__MODULE__, :ok, opts)
  end

  # Server

  def init(:ok) do
    do_work()
    schedule_work()
    {:ok, %{}}
  end

  def handle_info(:work, state) do
    do_work()
    schedule_work()
    {:noreply, state}
  end

  def handle_info(_msg, state) do
    {:noreply, state}
  end

  defp schedule_work do
    interval =
      System.get_env("PING_INTERVAL")
      |> String.to_integer

    Process.send_after(self(), :work, interval * 1000)
  end

  defp do_work do
    body = WeatherScraper.Scraper.get!("/weather?q=Manila").body
    weather =
      %WeatherScraper.Weather{
        city:     body["name"],
        temp_min: body["main"]["temp_min"],
        temp_max: body["main"]["temp_max"],
        humidity: body["main"]["humidity"],
        pressure: body["main"]["pressure"],
        time:     DateTime.utc_now
      }
    WeatherScraper.Repo.insert!(weather)
  end
end
