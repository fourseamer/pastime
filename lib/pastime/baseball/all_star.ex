defmodule Pastime.Baseball.AllStar do
  use Ecto.Schema

  alias Pastime.Baseball.League
  alias Pastime.Baseball.Person
  alias Pastime.Baseball.Team

  schema "all_star" do
    field :year_id, :integer
    field :game_num, :integer
    field :game_id, :string
    field :teamid, :string
    field :gp, :integer
    field :starting_pos, :integer
    belongs_to :person, Person, [foreign_key: :person_id, references: :person_id, type: :string]
    belongs_to :team, Team
    belongs_to :league, League, [foreign_key: :league_id, references: :league_id, type: :string]
  end
end
