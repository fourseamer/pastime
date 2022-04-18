defmodule PastimeWeb.TeamController do
  use PastimeWeb, :controller

  alias Pastime.Baseball

  def index(conn, _params) do
    teams = Baseball.list_teams()
    render(conn, "index.html", teams: teams)
  end

  def show(conn, %{"franchise_id" => franchise_id, "year_id" => year_id}) do
    team = Baseball.get_team_by!(franchise_id: franchise_id, year_id: year_id)
    render(conn, "show.html", team: team)
  end
end
