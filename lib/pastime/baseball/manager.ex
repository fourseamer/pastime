defmodule Pastime.Baseball.Manager do
  use Ecto.Schema

  schema "manager" do
    field :person_id, :integer
    field :year, :integer
    field :team_id, :integer
    field :league_id, :integer
    field :inseason, :integer
    field :g, :integer
    field :w, :integer
    field :l, :integer
    field :rank, :integer
    field :is_player_manager, :boolean
  end
end
