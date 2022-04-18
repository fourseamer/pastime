defmodule Pastime.Baseball.Fielding do
  use Ecto.Schema

  alias Pastime.Baseball.League
  alias Pastime.Baseball.Person
  alias Pastime.Baseball.Team

  schema "fielding" do
    field :year_id, :integer
    field :stint, :integer
    field :teamid, :string
    field :pos, :string
    field :g, :integer
    field :gs, :integer
    field :inn_outs, :integer
    field :po, :integer
    field :a, :integer
    field :e, :integer
    field :dp, :integer
    field :pb, :integer
    field :wp, :integer
    field :sb, :integer
    field :cs, :integer
    field :zr, :string
    belongs_to :person, Person, [foreign_key: :person_id, references: :person_id, type: :string]
    belongs_to :team, Team
    belongs_to :league, League, [foreign_key: :league_id, references: :league_id, type: :string]
  end
end
