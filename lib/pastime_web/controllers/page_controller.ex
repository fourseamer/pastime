defmodule PastimeWeb.PageController do
  use PastimeWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
