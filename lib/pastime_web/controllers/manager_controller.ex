defmodule PastimeWeb.ManagerController do
  use PastimeWeb, :controller

  alias Pastime.Baseball

  def index(conn, params) do
    page = Baseball.list_managers(params)
    render(conn, "index.html", managers: page)
  end

  def show(conn, %{"id" => id}) do
    preloads = [managers: [team: [:league]]]
    manager = Baseball.get_manager(id: id, preloads: preloads)
    render(conn, "show.html", manager: manager)
  end
end
