defmodule PastimeWeb.ParkController do
  use PastimeWeb, :controller

  import Ecto.Query
  alias Pastime.Baseball
  alias Pastime.Baseball.ParkConfig

  def index(conn, _params) do
    conn = Plug.Conn.fetch_query_params(conn)
    params = conn.query_params
    page = Baseball.list_parks(params: params)
    render(conn, "index.html", parks: page)
  end

  def show(conn, %{"id" => id}) do
    park_configs_query = (from pc in ParkConfig, order_by: [desc: pc.year])
    preloads = [park_configs: park_configs_query]
    park = Baseball.get_park(id: id, preloads: preloads)
    render(conn, "show.html", park: park)
  end
end
