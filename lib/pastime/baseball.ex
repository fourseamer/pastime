defmodule Pastime.Baseball do
  @moduledoc """
  The Baseball context.
  """

  import Ecto.Query

  alias Pastime.BaseballRepo
  alias Pastime.Baseball.Batting
  alias Pastime.Baseball.Fielding
  alias Pastime.Baseball.Franchise
  alias Pastime.Baseball.Person
  alias Pastime.Baseball.Pitching
  alias Pastime.Baseball.Team
  alias Pastime.Baseball.Manager
  alias Pastime.Baseball.Park

  ###
  ### PLAYERS
  ###
  def list_players(opts \\ []) do
    preloads = Keyword.get(opts, :preloads, [])

    Person
    |> BaseballRepo.all()
    |> BaseballRepo.preload(preloads)
  end

  def get_player(opts \\ []) do
    preloads = Keyword.get(opts, :preloads, [])

    Person
    |> BaseballRepo.get_by(id: Keyword.get(opts, :id, nil))
    |> BaseballRepo.preload(preloads)
  end

  def get_player_by(params) do
    BaseballRepo.get_by(Person, params)
  end

  ###
  ### FRANCHISES
  ###
  def list_franchises(opts \\ []) do
    preloads = Keyword.get(opts, :preloads, [])

    Franchise
    |> BaseballRepo.all()
    |> BaseballRepo.preload(preloads)
  end

  def get_franchise(opts \\ []) do
    preloads = Keyword.get(opts, :preloads, [])

    Franchise
    |> BaseballRepo.get_by(id: Keyword.get(opts, :id, nil))
    |> BaseballRepo.preload(preloads)
  end

  def get_franchise_by(params) do
    BaseballRepo.get_by(Franchise, params)
  end

  ###
  ### TEAMS
  ###
  def list_teams do
    BaseballRepo.all(Team)
  end

  def get_team(franchise_id, year_id) do
    BaseballRepo.get(Team, franchise_id, year_id)
  end

  def get_team_by(params) do
    BaseballRepo.get_by(Team, params)
  end

  ###
  ### BATTING
  ###
  def get_batting(person_id) do
    BaseballRepo.get(Batting, person_id)
  end

  def get_battings(person_id: person_id) do
    BaseballRepo.all(from(b in Batting, where: b.person_id == ^person_id))
  end

  def get_batting_by(params) do
    BaseballRepo.get_by(Batting, params)
  end

  ###
  ### PITCHING
  ###
  def get_pitching(person_id) do
    BaseballRepo.get(Pitching, person_id)
  end

  def get_pitchings(person_id: person_id) do
    BaseballRepo.all(from(p in Pitching, where: p.person_id == ^person_id))
  end

  def get_pitching_by(params) do
    BaseballRepo.get_by(Pitching, params)
  end

  ###
  ### FIELDING
  ###
  def get_fielding(person_id) do
    BaseballRepo.get(Fielding, person_id)
  end

  def get_fieldings(person_id: person_id) do
    BaseballRepo.all(from(f in Fielding, where: f.person_id == ^person_id))
  end

  def get_fielding_by(params) do
    BaseballRepo.get_by(Fielding, params)
  end

  ###
  ### MANAGERS
  ###
  def list_managers do
    BaseballRepo.all(Manager)
  end

  def get_managers(team_id: team_id) do
    BaseballRepo.all(from(m in Manager, where: m.team_id == ^team_id)) |> BaseballRepo.preload([
      :person
    ])
  end

  ###
  ### PARKS
  ###
  def list_parks do
    BaseballRepo.all(Park)
  end

  def get_park(park_id: park_id) do
    BaseballRepo.get(Park, park_id)
  end
end
