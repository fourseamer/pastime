defmodule Pastime.Baseball.Appearance do
  use Ecto.Schema

  schema "appearance" do
    field :person_id, :integer
    field :year, :integer
    field :team_id, :integer
    field :league_id, :integer
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
  end
end
