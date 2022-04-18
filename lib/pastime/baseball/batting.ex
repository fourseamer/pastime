defmodule Pastime.Baseball.Batting do
  use Ecto.Schema

  alias Pastime.Baseball.League
  alias Pastime.Baseball.Person
  alias Pastime.Baseball.Team

  schema "batting" do
    field :year_id, :integer
    field :stint, :integer
    field :teamid, :string
    field :g, :integer
    field :ab, :integer
    field :r, :integer
    field :h, :integer
    field :"2b", :integer
    field :"3b", :integer
    field :hr, :integer
    field :rbi, :integer
    field :sb, :integer
    field :cs, :integer
    field :bb, :integer
    field :so, :integer
    field :ibb, :integer
    field :hbp, :integer
    field :sh, :integer
    field :sf, :integer
    field :gidp, :integer
    belongs_to :person, Person, [foreign_key: :person_id, references: :person_id, type: :string]
    belongs_to :team, Team
    belongs_to :league, League, [foreign_key: :league_id, references: :league_id, type: :string]
  end
end
