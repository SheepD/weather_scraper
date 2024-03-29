defmodule WeatherScraper.MixProject do
  use Mix.Project

  def project do
    [
      app: :weather_scraper,
      version: "0.1.0",
      elixir: "~> 1.13.4",
      start_permanent: Mix.env() == :prod,
      deps: deps(),
      preferred_cli_env: [
        vcr: :test,
        "vcr.delete": :test,
        "vcr.check": :test,
        "vcr.show": :test
      ]
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
      {:credo, "~> 1.4", only: [:dev, :test], runtime: false},
      {:ecto_sql, "~> 3.0"},
      {:exvcr, "~> 0.11", only: :test},
      {:httpoison, "~> 1.0"},
      {:mix_test_watch, "~> 0.8", except: :prod, runtime: false},
      {:poison, "~> 3.1"},
      {:postgrex, ">= 0.0.0"}
    ]
  end
end
