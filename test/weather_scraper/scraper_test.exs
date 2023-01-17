defmodule WeatherScraper.ScraperTest do
  use ExUnit.Case, async: true
  use ExVCR.Mock, adapter: ExVCR.Adapter.Hackney

  alias WeatherScraper.Scraper

  setup_all do
    HTTPoison.start()

    :ok
  end

  describe "init/1" do
    test "schedules initial work" do
      use_cassette "open_weather_map_success" do
        assert {:ok, []} = Scraper.init([])

        assert_receive :fetch_weather_data, :timer.seconds(2)
      end
    end
  end

  describe "handle_info/2 :fetch_weather_data" do
    test "schedules more work" do
      use_cassette "open_weather_map_success" do
        assert {:noreply, []} = Scraper.handle_info(:fetch_weather_data, [])

        assert_receive :fetch_weather_data, :timer.seconds(2)
      end
    end
  end
end
