defmodule Pastime.Baseball.ParkConfig do
  use Ecto.Schema

  alias Pastime.Baseball.Park

  schema "park_config" do
    field :name, :string
    field :year, :integer
    field :capacity, :integer
    field :surface, :string
    field :area_fair, :string
    field :cover, :string
    field :lf_dim, :integer
    field :slf_dim, :integer
    field :lfa_dim, :integer
    field :lc_dim, :integer
    field :lcc_dim, :integer
    field :cf_dim, :integer
    field :rcc_dim, :integer
    field :rc_dim, :integer
    field :rfa_dim, :integer
    field :srf_dim, :integer
    field :rf_dim, :integer
    field :backstop, :integer
    field :foul, :string
    field :lf_w, :integer
    field :lc_w, :integer
    field :cf_w, :integer
    field :rc_w, :integer
    field :rf_w, :integer
    field :comments, :string
    belongs_to :park, Park
  end
end
