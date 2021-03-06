defmodule Pastime.Baseball.Team do
  use Ecto.Schema

  schema "team" do
    field :year, :integer
    field :rank, :integer
    field :g, :integer
    field :g_home, :integer
    field :w, :integer
    field :l, :integer
    field :division_win, :boolean
    field :wild_card_win, :boolean
    field :league_win, :boolean
    field :world_series_win, :boolean
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
    field :park_name, :string
    field :attendance, :integer
    field :bpf, :integer
    field :ppf, :integer
    field :team_id_br, :string
    field :team_id_lahman45, :string
    field :team_id_retro, :string
    has_many :battings, Pastime.Baseball.Batting
    has_many :vw_battings, Pastime.Baseball.VwBatting
    has_many :fieldings, Pastime.Baseball.Fielding
    has_many :vw_fieldings, Pastime.Baseball.VwFielding
    has_many :pitchings, Pastime.Baseball.Pitching
    has_many :vw_pitchings, Pastime.Baseball.VwPitching
    has_many :managers, Pastime.Baseball.Manager
    has_many :appearances, Pastime.Baseball.Appearance
    belongs_to :league, Pastime.Baseball.League
    belongs_to :franchise, Pastime.Baseball.Franchise
    belongs_to :division, Pastime.Baseball.Division
    belongs_to :park, Pastime.Baseball.Park
  end
end
