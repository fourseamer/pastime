defmodule Pastime.Repo do
  use Ecto.Repo,
    otp_app: :pastime,
    adapter: Ecto.Adapters.Postgres
end
