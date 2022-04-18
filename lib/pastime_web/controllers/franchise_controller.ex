defmodule PastimeWeb.FranchiseController do
  use PastimeWeb, :controller

  alias Pastime.Baseball

  def index(conn, _params) do
    franchises = Baseball.list_franchises()
    render(conn, "index.html", franchises: franchises)
  end

  def show(conn, %{"franchise_id" => franchise_id}) do
    franchise = Baseball.get_franchise_by!(franchise_id: franchise_id)
    render(conn, "show.html", franchise: franchise)
  end
end
