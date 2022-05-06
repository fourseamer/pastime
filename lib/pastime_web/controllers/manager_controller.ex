defmodule PastimeWeb.ManagerController do
  use PastimeWeb, :controller

  alias Pastime.Baseball

  def index(conn, _params) do
    conn = Plug.Conn.fetch_query_params(conn)
    params = conn.query_params
    page = Baseball.list_managers(params: params)
    render(conn, "index.html", managers: page)
  end

  def show(conn, %{"id" => id}) do
    preloads = [managers: [team: [:league]]]
    manager = Baseball.get_manager(id: id, preloads: preloads)
    render(conn, "show.html", manager: manager)
  end
end
