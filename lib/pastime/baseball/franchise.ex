defmodule Pastime.Baseball.Franchise do
  use Ecto.Schema

  alias Pastime.Baseball.Team

  schema "franchise" do
    field :franchise_id, :string
    field :name, :string
    field :active, :string
    field :na_assoc, :string
    has_many :teams, Team, [foreign_key: :franchise_id, references: :franchise_id]
  end
end
