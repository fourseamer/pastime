defmodule Pastime.Baseball.Team do
  use Ecto.Schema

  alias Pastime.Baseball.AllStar
  alias Pastime.Baseball.Appearance
  alias Pastime.Baseball.Batting
  alias Pastime.Baseball.Division
  alias Pastime.Baseball.Fielding
  alias Pastime.Baseball.FieldingOFSplit
  alias Pastime.Baseball.Franchise
  alias Pastime.Baseball.League
  alias Pastime.Baseball.Manager
  alias Pastime.Baseball.Park
  alias Pastime.Baseball.Pitching

  schema "team" do
    field :team_id, :string
    field :year_id, :integer
    field :div_id, :string
    field :rank, :integer
    field :g, :integer
    field :g_home, :integer
    field :w, :integer
    field :l, :integer
    field :division_win, :string
    field :wild_card_win, :string
    field :league_win, :string
    field :world_series_win, :string
    field :r, :integer
    field :ab, :integer
    field :h, :integer
    field :"2b", :integer
    field :"3b", :integer
    field :hr, :integer
    field :bb, :integer
    field :so, :integer
    field :sb, :integer
    field :cs, :integer
    field :hbp, :integer
    field :sf, :integer
    field :ra, :integer
    field :er, :integer
    field :era, :float
    field :cg, :integer
    field :sho, :integer
    field :sv, :integer
    field :ip_outs, :integer
    field :ha, :integer
    field :hra, :integer
    field :bba, :integer
    field :soa, :integer
    field :e, :integer
    field :dp, :integer
    field :fp, :float
    field :name, :string
    field :attendance, :integer
    field :bpf, :integer
    field :ppf, :integer
    field :team_id_br, :string
    field :team_id_lahman45, :string
    field :team_id_retro, :string
    belongs_to :league, League, [foreign_key: :league_id, references: :league_id, type: :string]
    belongs_to :franchise, Franchise, [foreign_key: :franchise_id, references: :franchise_id, type: :string]
    belongs_to :division, Division
    belongs_to :park, Park, [foreign_key: :park_id, references: :park_id, type: :string]
    has_many :all_stars, AllStar
    has_many :appearances, Appearance
    has_many :battings, Batting
    has_many :fieldings, Fielding
    has_many :fielding_of_splits, FieldingOFSplit
    has_many :managers, Manager
    has_many :pitchings, Pitching
  end
end
