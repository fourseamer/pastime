defmodule Pastime.Baseball.VwManager do
  use Ecto.Schema

  @primary_key false
  schema "vw_manager" do
    field :person_id, :integer
    field :name_first, :string
    field :name_last, :string
    field :yrs, :integer
    field :from, :integer
    field :to, :integer
    field :w, :integer
    field :l, :integer
    field :pct, :decimal
    field :g, :integer
    field :best_finish, :integer
    field :worst_finish, :integer
    field :avg_finish, :decimal
  end
end
