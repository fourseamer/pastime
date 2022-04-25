defmodule Pastime.Baseball.Franchise do
  use Ecto.Schema

  schema "franchise" do
    field :abbreviation, :string
    field :name, :string
    field :na_assoc, :string
    field :is_active, :boolean
    has_many :teams, Pastime.Baseball.Team
  end
end
