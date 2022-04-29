defmodule Pastime.Baseball.VwPitching do
  use Ecto.Schema

  @primary_key false
  schema "vw_pitching" do
    field :name_first, :string
    field :name_last, :string
    field :year, :integer
    field :stint, :integer
    field :age, :integer
    field :w, :integer
    field :l, :integer
    field :era, :decimal
    field :g, :integer
    field :gs, :integer
    field :gf, :integer
    field :cg, :integer
    field :sho, :integer
    field :sv, :integer
    field :ip_outs, :integer
    field :ip, :decimal
    field :h, :integer
    field :r, :integer
    field :er, :integer
    field :hr, :integer
    field :bb, :integer
    field :ibb, :integer
    field :so, :integer
    field :hbp, :integer
    field :bk, :integer
    field :wp, :integer
    field :bfp, :integer
    field :sh, :integer
    field :sf, :integer
    field :gidp, :integer
    field :ba_opp, :decimal
    field :whip, :decimal
    field :h9, :decimal
    field :hr9, :decimal
    field :bb9, :decimal
    field :so9, :decimal
    field :"so/w", :decimal
    belongs_to :person, Pastime.Baseball.Person
    belongs_to :team, Pastime.Baseball.Team
    belongs_to :league, Pastime.Baseball.League
  end
end
