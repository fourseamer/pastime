defmodule Pastime.Baseball.Pitching do
  use Ecto.Schema

  alias Pastime.Baseball.League
  alias Pastime.Baseball.Person
  alias Pastime.Baseball.Team

  schema "pitching" do
    field :year_id, :integer
    field :stint, :integer
    field :teamid, :string
    field :w, :integer
    field :l, :integer
    field :g, :integer
    field :gs, :integer
    field :cg, :integer
    field :sho, :integer
    field :sv, :integer
    field :ip_outs, :integer
    field :h, :integer
    field :er, :integer
    field :hr, :integer
    field :bb, :integer
    field :so, :integer
    field :ba_opp, :float
    field :era, :float
    field :ibb, :integer
    field :wp, :integer
    field :hbp, :integer
    field :bk, :integer
    field :bfp, :integer
    field :gf, :integer
    field :r, :integer
    field :sh, :integer
    field :sf, :integer
    field :gidp, :integer
    belongs_to :person, Person, [foreign_key: :person_id, references: :person_id, type: :string]
    belongs_to :team, Team
    belongs_to :league, League, [foreign_key: :league_id, references: :league_id, type: :string]
  end
end
