defmodule PastimeWeb.PlayerController do
  use PastimeWeb, :controller

  alias Pastime.Baseball

  def index(conn, _params) do
    players = Baseball.list_players()
    render(conn, "index.html", players: players)
  end

  def show(conn, %{"id" => id}) do
    preloads = [battings: [:team, :league], fieldings: [:team, :league], pitchings: [:team, :league]]
    player = Baseball.get_player(id: id, preloads: preloads)
    render(conn, "show.html", player: player)
  end
end
