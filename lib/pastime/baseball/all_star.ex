defmodule Pastime.Baseball.AllStar do
  use Ecto.Schema

  alias Pastime.Baseball.League
  alias Pastime.Baseball.Person
  alias Pastime.Baseball.Team

  schema "all_star" do
    field :person_id, :integer
    field :year, :integer
    field :game_num, :integer
    field :game_id, :string
    field :team_id, :integer
    field :league_id, :integer
    field :gp, :integer
    field :starting_pos, :integer
  end
end
