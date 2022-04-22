defmodule Pastime.Baseball.Division do
  use Ecto.Schema

  schema "division" do
    field :league_id, :integer
    field :name, :string
    field :is_active, :boolean
  end
end
