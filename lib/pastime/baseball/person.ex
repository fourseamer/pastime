defmodule Pastime.Baseball.Person do
  use Ecto.Schema

  alias Pastime.Baseball.AllStar
  alias Pastime.Baseball.Appearance
  alias Pastime.Baseball.Batting
  alias Pastime.Baseball.Fielding
  alias Pastime.Baseball.FieldingOF
  alias Pastime.Baseball.FieldingOFSplit
  alias Pastime.Baseball.Manager
  alias Pastime.Baseball.Pitching

  schema "person" do
    field :person_id, :string
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
    has_many :all_stars, AllStar, [foreign_key: :person_id, references: :person_id]
    has_many :appearances, Appearance, [foreign_key: :person_id, references: :person_id]
    has_many :battings, Batting, [foreign_key: :person_id, references: :person_id]
    has_many :fieldings, Fielding, [foreign_key: :person_id, references: :person_id]
    has_many :fielding_ofs, FieldingOF, [foreign_key: :person_id, references: :person_id]
    has_many :fielding_of_splits, FieldingOFSplit, [foreign_key: :person_id, references: :person_id]
    has_many :managers, Manager, [foreign_key: :person_id, references: :person_id]
    has_many :pitchings, Pitching, [foreign_key: :person_id, references: :person_id]
  end
end
