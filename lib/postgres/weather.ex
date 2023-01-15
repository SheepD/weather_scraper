defmodule WeatherScraper.Postgres.Weather do
  use Ecto.Schema

  import Ecto.Changeset

  schema "weather" do
    field(:city, :string)
    field(:temp_min, :float)
    field(:temp_max, :float)
    field(:humidity, :integer)
    field(:pressure, :integer)
    field(:time, :utc_datetime)
  end

  @spec changeset(
          {map(), map()} | %{:__struct__ => atom(), optional(atom()) => any()},
          :invalid | %{optional(:__struct__) => none(), optional(atom() | binary()) => any()}
        ) :: Ecto.Changeset.t()
  def changeset(weather, params) do
    attrs = [:city, :temp_min, :temp_max, :humidity, :pressure, :time]

    weather
    |> cast(params, attrs)
    |> validate_required(attrs)
  end
end
