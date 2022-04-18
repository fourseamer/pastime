defmodule Pastime.Baseball.Manager do
  use Ecto.Schema

  alias Pastime.Baseball.League
  alias Pastime.Baseball.Person
  alias Pastime.Baseball.Team

  schema "manager" do
    field :year_id, :integer
    field :teamid, :string
    field :inseason, :integer
    field :g, :integer
    field :w, :integer
    field :l, :integer
    field :rank, :integer
    field :plyr_mgr, :string
    belongs_to :person, Person, [foreign_key: :person_id, references: :person_id, type: :string]
    belongs_to :team, Team
    belongs_to :league, League, [foreign_key: :league_id, references: :league_id, type: :string]
  end
end
