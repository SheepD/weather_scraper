defmodule WeatherScraper.Postgres.Repo.Migrations.AddWeatherTable do
  use Ecto.Migration

  def change do
    create table("weather") do
      add :city,     :string
      add :temp_min, :float
      add :temp_max, :float
      add :humidity, :integer
      add :pressure, :integer
      add :time,     :utc_datetime
    end
  end
end
