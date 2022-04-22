defmodule Pastime.Baseball.FieldingOF do
  use Ecto.Schema

  schema "fielding_of" do
    field :person_id, :integer
    field :year, :integer
    field :stint, :integer
    field :g_lf, :integer
    field :g_cf, :integer
    field :g_rf, :integer
  end
end
