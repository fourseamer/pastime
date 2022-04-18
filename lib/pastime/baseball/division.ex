defmodule Pastime.Baseball.Division do
  use Ecto.Schema

  alias Pastime.Baseball.League
  alias Pastime.Baseball.Team

  schema "division" do
    field :name, :string
    field :active, :string
    belongs_to :league, League, [foreign_key: :league_id, references: :league_id, type: :string]
    has_many :teams, Team
  end
end
