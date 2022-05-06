defmodule Pastime.BaseballRepo do
  use Ecto.Repo,
    otp_app: :pastime,
    adapter: Ecto.Adapters.Postgres

  use Paginator
end
