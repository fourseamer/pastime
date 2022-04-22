defmodule Pastime.Baseball.Person do
  use Ecto.Schema

  schema "person" do
    field :birth_year, :integer
    field :birth_month, :integer
    field :birth_day, :integer
    field :birth_country, :string
    field :birth_state, :string
    field :birth_city, :string
    field :death_year, :integer
    field :death_month, :integer
    field :death_day, :integer
    field :death_country, :string
    field :death_state, :string
    field :death_city, :string
    field :name_first, :string
    field :name_last, :string
    field :name_given, :string
    field :weight, :integer
    field :height, :integer
    field :bats, :string
    field :throws, :string
    field :debut, :date
    field :final_game, :date
    field :retro_id, :string
    field :bbref_id, :string
  end
end
