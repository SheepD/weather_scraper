defmodule WeatherScraper.Supervisor do
  use Supervisor

  def start_link(opts) do
    Supervisor.start_link(__MODULE__, :ok, opts)
  end

  def init(:ok) do
    children = [
      supervisor(WeatherScraper.Postgres.Repo, []),
      {WeatherScraper.Scheduler, name: WeatherScraper.Scheduler}
    ]

    Supervisor.init(children, strategy: :one_for_one)
  end
end
