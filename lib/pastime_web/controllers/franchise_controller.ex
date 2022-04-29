defmodule PastimeWeb.FranchiseController do
  use PastimeWeb, :controller

  import Ecto.Query
  alias Pastime.Baseball
  alias Pastime.Baseball.Team

  def index(conn, _params) do
    franchises = Baseball.list_franchises()
    render(conn, "index.html", franchises: franchises)
  end

  def show(conn, %{"id" => id}) do
    teams_query = (from t in Team, order_by: [desc: t.year])
    preloads = [teams: {teams_query, [:park, managers: [:person]]}]
    franchise = Baseball.get_franchise(id: id, preloads: preloads)
    render(conn, "show.html", franchise: franchise)
  end
end
