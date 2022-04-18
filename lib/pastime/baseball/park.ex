defmodule Pastime.Baseball.Park do
  use Ecto.Schema

  alias Pastime.Baseball.ParkConfig
  alias Pastime.Baseball.Team

  schema "park" do
    field :park_id, :string
    field :name, :string
    field :city, :string
    field :state, :string
    field :start, :date
    field :end, :date
    field :league, :string
    field :notes, :string
    field :aka, :string
    field :exact, :string
    field :latitude, :float
    field :longitude, :float
    field :altitude, :integer
    has_many :park_configs, ParkConfig
    has_many :teams, Team
  end
end
