defmodule Pastime.Baseball.Pitching do
  use Ecto.Schema

  schema "pitching" do
    field :year, :integer
    field :stint, :integer
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
    belongs_to :person, Pastime.Baseball.Person
    belongs_to :team, Pastime.Baseball.Team
    belongs_to :league, Pastime.Baseball.League
  end
end
