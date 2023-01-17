defmodule WeatherScraper.WeatherApi.OpenWeatherMapClientTest do
  use ExUnit.Case, async: true
  use ExVCR.Mock, adapter: ExVCR.Adapter.Hackney

  alias WeatherScraper.WeatherApi.OpenWeatherMapClient
  alias WeatherScraper.Weather

  setup_all do
    HTTPoison.start()

    :ok
  end

  describe "process_request_url/1" do
    test "returns an escaped URI" do
      uri = OpenWeatherMapClient.process_request_url("/weather?q=!@#$%")

      assert "api.openweathermap.org/data/2.5/weather?q=!@#$%25&appid=test" = uri
    end
  end

  describe "process_response_body/1" do
    setup do
      body =
        "{\"coord\":{\"lon\":13.4105,\"lat\":52.5244},\"weather\":[{\"id\":803,\"main\":\"Clouds\",\"description\":\"broken clouds\",\"icon\":\"04d\"}],\"base\":\"stations\",\"main\":{\"temp\":278.04,\"feels_like\":272.76,\"temp_min\":277.18,\"temp_max\":278.68,\"pressure\":973,\"humidity\":79},\"visibility\":10000,\"wind\":{\"speed\":9.39,\"deg\":245,\"gust\":14.75},\"clouds\":{\"all\":75},\"dt\":1673947702,\"sys\":{\"type\":2,\"id\":2011538,\"country\":\"DE\",\"sunrise\":1673939297,\"sunset\":1673969034},\"timezone\":3600,\"id\":2950159,\"name\":\"Berlin\",\"cod\":200}"

      [body: body]
    end

    test "returns a symbolized map of expected parameters", %{body: body} do
      assert %{
               city: "Berlin",
               humidity: 79,
               pressure: 973,
               temp_max: 278.68,
               temp_min: 277.18,
               time: _
             } = OpenWeatherMapClient.process_response_body(body)
    end
  end

  describe "fetch_weather/1" do
    test "fetches weather data from the api" do
      use_cassette "open_weather_map_success" do
        assert {:ok,
                %Weather{
                  id: nil,
                  city: "Berlin",
                  humidity: 79,
                  pressure: 973,
                  temp_max: 279.23,
                  temp_min: 277.09,
                  time: _
                }} = OpenWeatherMapClient.fetch_weather("Berlin")
      end
    end
  end
end
