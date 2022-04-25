defmodule Pastime.Baseball.League do
  use Ecto.Schema

  schema "league" do
    field :abbreviation, :string
    field :name, :string
    field :is_active, :boolean
    has_many :teams, Pastime.Baseball.Team
    has_many :divisions, Pastime.Baseball.Division
    has_many :parks, Pastime.Baseball.Park
  end
end
