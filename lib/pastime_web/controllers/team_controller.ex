defmodule PastimeWeb.TeamController do
  use PastimeWeb, :controller

  alias Pastime.Baseball

  def index(conn, _params) do
    teams = Baseball.list_teams()
    render(conn, "index.html", teams: teams)
  end

  def show(conn, %{"id" => id}) do
    preloads = [:appearances, :league, :franchise, :park, vw_battings: [:person], vw_pitchings: [:person], vw_fieldings: [:person], managers: [:person]]
    team = Baseball.get_team(id: id, preloads: preloads)
    render(conn, "show.html", team: team)
  end
end
