defmodule Pastime.Baseball.FieldingOF do
  use Ecto.Schema

  alias Pastime.Baseball.Person

  schema "fielding_of" do
    field :year_id, :integer
    field :stint, :integer
    field :g_lf, :integer
    field :g_cf, :integer
    field :g_rf, :integer
    belongs_to :person, Person, [foreign_key: :person_id, references: :person_id, type: :string]
  end
end
