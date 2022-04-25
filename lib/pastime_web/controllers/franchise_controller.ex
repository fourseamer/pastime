defmodule PastimeWeb.FranchiseController do
  use PastimeWeb, :controller

  alias Pastime.Baseball

  def index(conn, _params) do
    franchises = Baseball.list_franchises()
    render(conn, "index.html", franchises: franchises)
  end

  def show(conn, %{"id" => id}) do
    preloads = [teams: [:park, managers: [:person]]]
    franchise = Baseball.get_franchise(id: id, preloads: preloads)
    IO.inspect(franchise)
    render(conn, "show.html", franchise: franchise)
  end
end
