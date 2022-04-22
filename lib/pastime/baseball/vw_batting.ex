defmodule Pastime.Baseball.VwBatting do
  use Ecto.Schema

  @primary_key false
  schema "vw_batting" do
    field :name_first, :string
    field :name_last, :string
    field :person_id, :string
    field :year_id, :integer
    field :stint, :integer
    field :team_id, :integer
    field :league_id, :string
    field :franchise_id, :string
    field :age, :integer
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
    field :ba, :float
    field :obp, :float
    field :slg, :float
    field :ops, :float
    field :tb, :integer
    field :gidp, :integer
    field :hbp, :integer
    field :sh, :integer
    field :sf, :integer
    field :ibb, :integer
  end
end
