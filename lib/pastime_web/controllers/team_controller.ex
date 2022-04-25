defmodule PastimeWeb.TeamController do
  use PastimeWeb, :controller

  alias Pastime.Baseball

  def index(conn, _params) do
    teams = Baseball.list_teams()
    render(conn, "index.html", teams: teams)
  end

  def show(conn, %{"franchise_id" => franchise_id, "year" => year}) do
    team = Baseball.get_team_by!(franchise_id: franchise_id, year: year)
    managers = Baseball.get_managers(team_id: team.id)
    park = Baseball.get_park(park_id: team.park_id)
    battings = Baseball.get_batting(team_id: team.id)
    pitchings = Baseball.get_pitching(team_id: team.id)
    fieldings = Baseball.get_fielding(team_id: team.id)
    render(conn, "show.html", team: team, managers: managers)
  end
end
