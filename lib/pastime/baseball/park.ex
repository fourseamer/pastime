defmodule Pastime.Baseball.Park do
  use Ecto.Schema

  schema "park" do
    field :name, :string
    field :city, :string
    field :state, :string
    field :start, :date
    field :end, :date
    field :notes, :string
    field :aka, :string
    field :latitude, :float
    field :longitude, :float
    field :altitude, :integer
    field :is_exact, :boolean
    belongs_to :league, Pastime.Baseball.League
    has_many :teams, Pastime.Baseball.Team
    has_many :park_configs, Pastime.Baseball.ParkConfig
  end
end
