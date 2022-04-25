defmodule Pastime.Baseball.Manager do
  use Ecto.Schema

  schema "manager" do
    field :year, :integer
    field :inseason, :integer
    field :g, :integer
    field :w, :integer
    field :l, :integer
    field :rank, :integer
    field :is_player_manager, :boolean
    belongs_to :person, Pastime.Baseball.Person
    belongs_to :team, Pastime.Baseball.Team
    belongs_to :league, Pastime.Baseball.League
  end
end
