defmodule PastimeWeb.BaseballController do
  use PastimeWeb, :controller

  alias Pastime.Baseball

  def index(conn, _params) do
    players = Baseball.list_players()
    render(conn, "index.html", players: players)
  end

  def show(conn, %{"person_id" => person_id}) do
    player = Baseball.get_player_by!(person_id: person_id)
    render(conn, "show.html", player: player)
  end
end
