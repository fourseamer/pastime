defmodule Pastime.Baseball.Park do
  use Ecto.Schema

  schema "park" do
    field :name, :string
    field :city, :string
    field :state, :string
    field :start, :date
    field :end, :date
    field :league_id, :integer
    field :notes, :string
    field :aka, :string
    field :latitude, :float
    field :longitude, :float
    field :altitude, :integer
    field :is_exact, :boolean
  end
end
