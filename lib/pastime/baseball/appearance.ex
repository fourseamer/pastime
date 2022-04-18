defmodule Pastime.Baseball.Appearance do
  use Ecto.Schema

  alias Pastime.Baseball.League
  alias Pastime.Baseball.Person
  alias Pastime.Baseball.Team

  schema "appearance" do
    field :year_id, :integer
    field :teamid, :string
    field :g_all, :integer
    field :gs, :integer
    field :g_batting, :integer
    field :g_defense, :integer
    field :g_p, :integer
    field :g_c, :integer
    field :g_1b, :integer
    field :g_2b, :integer
    field :g_3b, :integer
    field :g_ss, :integer
    field :g_lf, :integer
    field :g_cf, :integer
    field :g_rf, :integer
    field :g_of, :integer
    field :g_dh, :integer
    field :g_ph, :integer
    field :g_pr, :integer
    belongs_to :person, Person, [foreign_key: :person_id, references: :person_id, type: :string]
    belongs_to :team, Team
    belongs_to :league, League, [foreign_key: :league_id, references: :league_id, type: :string]
  end
end
