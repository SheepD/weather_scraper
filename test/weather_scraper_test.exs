defmodule WeatherScraperTest do
  use ExUnit.Case
  doctest WeatherScraper

  test "greets the world" do
    assert WeatherScraper.hello() == :world
  end
end
