defmodule Pastime.Baseball.League do
  use Ecto.Schema

  schema "league" do
    field :abbreviation, :string
    field :name, :string
    field :is_active, :boolean
  end
end
