defmodule Pastime.Baseball.Fielding do
  use Ecto.Schema

  schema "fielding" do
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
    field :zr, :string
    belongs_to :person, Pastime.Baseball.Person
    belongs_to :team, Pastime.Baseball.Team
    belongs_to :league, Pastime.Baseball.League
  end
end
