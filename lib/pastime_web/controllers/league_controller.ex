defmodule PastimeWeb.LeagueController do
  use PastimeWeb, :controller

  alias Pastime.Baseball

  def index(conn, _params) do
    leagues = Baseball.list_leagues()
    render(conn, "index.html", leagues: leagues)
  end

  def show(conn, %{"id" => id}) do
    preloads = [:divisions]
    league = Baseball.get_league(id: id, preloads: preloads)
    render(conn, "show.html", league: league)
  end
end
