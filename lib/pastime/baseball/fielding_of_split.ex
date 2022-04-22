defmodule Pastime.Baseball.FieldingOFSplit do
  use Ecto.Schema

  schema "fielding_of_split" do
    field :person_id, :integer
    field :year, :integer
    field :stint, :integer
    field :team_id, :integer
    field :league_id, :integer
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
  end
end
