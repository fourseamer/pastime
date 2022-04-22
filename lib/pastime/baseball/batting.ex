defmodule Pastime.Baseball.Batting do
  use Ecto.Schema

  schema "batting" do
    field :person_id, :integer
    field :year, :integer
    field :stint, :integer
    field :team_id, :integer
    field :league_id, :integer
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
  end
end
