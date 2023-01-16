defmodule  WeatherScraper.WeatherApi.OpenWeatherMapClientTest do
  use ExUnit.Case

  alias WeatherScraper.WeatherApi.OpenWeatherMapClient

  describe "process_url/1" do
    test "returns an escaped URI" do
      uri = OpenWeatherMapClient.process_url("/weather?q=Berlin")

      assert uri == "api.openweathermap.org/data/2.5/weather?q=Berlin&APPID=test"
    end
  end

  describe "process_response_body/1" do
  end

  describe "fetch_weather/0" do
  end

  describe "format_response/1" do
  end
end
