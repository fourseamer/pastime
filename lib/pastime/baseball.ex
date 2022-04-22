defmodule Pastime.Baseball do
  @moduledoc """
  The Baseball context.
  """

  import Ecto.Query

  alias Pastime.BaseballRepo
  alias Pastime.Baseball.Franchise
  alias Pastime.Baseball.Person
  alias Pastime.Baseball.Team
  alias Pastime.Baseball.Manager
  alias Pastime.Baseball.Park

  ###
  ### PLAYERS
  ###
  def list_players do
    BaseballRepo.all(Person)
  end

  def get_player!(id) do
    BaseballRepo.get!(Person, id)
  end

  def get_player_by!(params) do
    BaseballRepo.get_by!(Person, params) |> BaseballRepo.preload([
      :battings,
      :pitchings,
      :fieldings,
      :all_stars,
      :appearances,
      :managers
    ])
  end

  ###
  ### FRANCHISES
  ###
  def list_franchises do
    BaseballRepo.all(Franchise)
  end

  def get_franchise(franchise_id) do
    BaseballRepo.get!(Franchise, franchise_id)
  end

  def get_franchise_by!(params) do
    BaseballRepo.get_by!(Franchise, params) |> BaseballRepo.preload([
      :teams,
    ])
  end

  ###
  ### TEAMS
  ###
  def list_teams do
    BaseballRepo.all(Team)
  end

  def get_team(franchise_id, year_id) do
    BaseballRepo.get!(Team, franchise_id, year_id)
  end

  def get_team_by!(params) do
    BaseballRepo.get_by!(Team, params)
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
    BaseballRepo.get!(Park, park_id)
  end
end
