defmodule Pastime.Baseball.VwFielding do
  use Ecto.Schema

  @primary_key false
  schema "vw_fielding" do
    field :name_first, :string
    field :name_last, :string
    field :year, :integer
    field :stint, :integer
    field :pos, :string
    field :g, :integer
    field :gs, :integer
    field :inn_outs, :integer
    field :po, :integer
    field :a, :integer
    field :e, :integer
    field :dp, :integer
    field :pb, :integer
    field :wp, :integer
    field :sb, :integer
    field :cs, :integer
    field :zr, :integer
    belongs_to :person, Pastime.Baseball.Person
    belongs_to :team, Pastime.Baseball.Team
    belongs_to :league, Pastime.Baseball.League
  end
end
