defmodule  WeatherScraper.WeatherApi.OpenWeatherMapClientTest do
  use ExUnit.Case, async: true
  use ExVCR.Mock, adapter: ExVCR.Adapter.Hackney

  alias WeatherScraper.WeatherApi.OpenWeatherMapClient

  setup_all do
    HTTPoison.start

    :ok
  end

  describe "process_request_url/1" do
    test "returns an escaped URI" do
      uri = OpenWeatherMapClient.process_request_url("/weather?q=!@#$%")

      assert uri == "api.openweathermap.org/data/2.5/weather?q=Berlin&appid=test"
    end
  end

  describe "process_response_body/1" do
    setup do
      payload = ""

      [payload: payload]
    end

    test "returns a symbolized map of expected parameters" do
    end
  end

  describe "fetch_weather/1" do
    test "fetches weather data from the api and inserts a new weather record" do
      use_cassette "open_weather_map_success" do
      end
    end
  end
end
