defmodule Pastime.Baseball do
  @moduledoc """
  The Baseball context.
  """

  import Ecto.Query

  alias Pastime.BaseballRepo
  alias Pastime.Baseball.Franchise
  alias Pastime.Baseball.VwFranchise
  alias Pastime.Baseball.Team
  alias Pastime.Baseball.Person
  alias Pastime.Baseball.Manager
  alias Pastime.Baseball.VwManager
  alias Pastime.Baseball.Park
  alias Pastime.Baseball.Batting
  alias Pastime.Baseball.Fielding
  alias Pastime.Baseball.Pitching

  ###
  ### FRANCHISES
  ###
  def list_franchises() do
    VwFranchise
    |> BaseballRepo.all()
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
  def list_teams(opts \\ []) do
    preloads = Keyword.get(opts, :preloads, [])

    Team
    |> BaseballRepo.all()
    |> BaseballRepo.preload(preloads)
  end

  def get_team(opts \\ []) do
    preloads = Keyword.get(opts, :preloads, [])

    Team
    |> BaseballRepo.get_by(id: Keyword.get(opts, :id, nil))
    |> BaseballRepo.preload(preloads)
  end

  def get_team_by(params) do
    BaseballRepo.get_by(Team, params)
  end

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
  ### MANAGERS
  ###
  def list_managers() do
    VwManager
    |> BaseballRepo.all()
  end

  def get_manager(opts \\ []) do
    preloads = Keyword.get(opts, :preloads, [])

    Person
    |> BaseballRepo.get_by(id: Keyword.get(opts, :id, nil))
    |> BaseballRepo.preload(preloads)
  end

  def get_manager_by(params) do
    BaseballRepo.get_by(Person, params)
  end

  ###
  ### PARKS
  ###
  def list_parks(opts \\ []) do
    preloads = Keyword.get(opts, :preloads, [])

    Park
    |> order_by(:name)
    |> BaseballRepo.all
    |> BaseballRepo.preload(preloads)
  end

  def get_park(opts \\ []) do
    preloads = Keyword.get(opts, :preloads, [])

    Park
    |> BaseballRepo.get_by(id: Keyword.get(opts, :id, nil))
    |> BaseballRepo.preload(preloads)
  end

  def get_park_by(params) do
    BaseballRepo.get_by(Park, params)
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
end
