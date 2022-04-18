defmodule Pastime.Baseball.League do
  use Ecto.Schema

  alias Pastime.Baseball.AllStar
  alias Pastime.Baseball.Appearance
  alias Pastime.Baseball.Batting
  alias Pastime.Baseball.Division
  alias Pastime.Baseball.Fielding
  alias Pastime.Baseball.FieldingOFSplit
  alias Pastime.Baseball.Manager
  alias Pastime.Baseball.Pitching
  alias Pastime.Baseball.Team

  schema "league" do
    field :league_id, :string
    field :name, :string
    field :active, :string
    has_many :all_stars, AllStar
    has_many :appearances, Appearance
    has_many :battings, Batting
    has_many :divisions, Division, [foreign_key: :league_id, references: :league_id]
    has_many :fieldings, Fielding
    has_many :fielding_of_splits, FieldingOFSplit
    has_many :managers, Manager
    has_many :pitchings, Pitching
    has_many :teams, Team, [foreign_key: :league_id, references: :league_id]
  end
end
