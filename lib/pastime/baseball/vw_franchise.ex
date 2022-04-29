defmodule Pastime.Baseball.VwFranchise do
  use Ecto.Schema

  @primary_key false
  schema "vw_franchise" do
    field :id, :integer
    field :name, :string
    field :is_active, :boolean
    field :from , :integer
    field :to, :integer
    field :g, :integer
    field :w, :integer
    field :l, :integer
    field :pct, :decimal
    field :division_wins, :integer
    field :league_wins, :integer
    field :world_series_wins, :integer
  end
end
