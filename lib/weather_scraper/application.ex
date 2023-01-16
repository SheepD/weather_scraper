defmodule WeatherScraper.Application do
  @moduledoc """
  Documentation for Weather Scraper Application
  """

  use Application

  alias WeatherScraper.{Repo, Scraper}

  @spec start(any, any) :: {:ok, pid} | {:error, any}
  def start(_type, _args) do
    children = [
      {Repo, []},
      {Scraper, []}
    ]

    Supervisor.start_link(children,
      strategy: :one_for_one,
      name: WeatherScraper.Supervisor
    )
  end
end
