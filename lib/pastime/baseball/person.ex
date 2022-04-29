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
    has_many :battings, Pastime.Baseball.Batting
    has_many :vw_battings, Pastime.Baseball.VwBatting
    has_many :fieldings, Pastime.Baseball.Fielding
    has_many :vw_fieldings, Pastime.Baseball.VwFielding
    has_many :pitchings, Pastime.Baseball.Pitching
    has_many :vw_pitchings, Pastime.Baseball.VwPitching
    has_many :managers, Pastime.Baseball.Manager
    has_many :appearances, Pastime.Baseball.Appearance
    has_many :all_stars, Pastime.Baseball.AllStar
  end
end
