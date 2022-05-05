defmodule PastimeWeb.ManagerController do
  use PastimeWeb, :controller

  import Ecto.Query
  alias Pastime.Baseball

  def index(conn, _params) do
    managers = Baseball.list_managers()
    render(conn, "index.html", managers: managers)
  end

  def show(conn, %{"id" => id}) do
    preloads = [managers: [team: [:league]]]
    manager = Baseball.get_manager(id: id, preloads: preloads)
    render(conn, "show.html", manager: manager)
  end
end
