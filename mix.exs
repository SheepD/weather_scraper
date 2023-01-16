defmodule WeatherScraper.MixProject do
  use Mix.Project

  def project do
    [
      app: :weather_scraper,
      version: "0.1.0",
      elixir: "~> 1.13.4",
      start_permanent: Mix.env() == :prod,
      deps: deps()
    ]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      extra_applications: [:logger],
      mod: {WeatherScraper.Application, []}
    ]
  end

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      {:ecto_sql, "~> 3.0"},
      {:postgrex, ">= 0.0.0"},
      {:httpoison, "~> 1.0"},
      {:mix_test_watch, "~> 0.8", except: :prod, runtime: false},
      {:poison, "~> 3.1"},
      {:credo, "~> 1.4", only: [:dev, :test], runtime: false}
    ]
  end
end
