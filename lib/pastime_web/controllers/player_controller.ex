defmodule PastimeWeb.PlayerController do
  use PastimeWeb, :controller

  alias Pastime.Baseball

  def index(conn, params) do
    page = Baseball.list_players(params)
    render(conn, "index.html", players: page)
  end

  def show(conn, %{"id" => id}) do
    preloads = [vw_battings: [:league, team: [:appearances]], vw_pitchings: [:team, :league], vw_fieldings: [:team, :league]]
    player = Baseball.get_player(id: id, preloads: preloads)
    render(conn, "show.html", player: player)
  end
end
