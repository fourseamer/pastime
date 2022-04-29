defmodule Pastime.Baseball.VwBatting do
  use Ecto.Schema

  @primary_key false
  schema "vw_batting" do
    field :name_first, :string
    field :name_last, :string
    field :year, :integer
    field :stint, :integer
    field :age , :integer
    field :g, :integer
    field :pa, :integer
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
    field :ba, :decimal
    field :obp, :decimal
    field :slg, :decimal
    field :ops, :decimal
    field :tb, :integer
    field :gidp, :integer
    field :hbp, :integer
    field :sh, :integer
    field :sf, :integer
    field :ibb, :integer
    belongs_to :person, Pastime.Baseball.Person
    belongs_to :team, Pastime.Baseball.Team
    belongs_to :league, Pastime.Baseball.League
  end
end
