import Config

# Configure your database
#
# The MIX_TEST_PARTITION environment variable can be used
# to provide built-in test partitioning in CI environment.
# Run `mix help test` for more information.
config :pastime, Pastime.Repo,
  username: "gregg",
  password: "",
  hostname: "localhost",
  database: "pastime_test#{System.get_env("MIX_TEST_PARTITION")}",
  pool: Ecto.Adapters.SQL.Sandbox,
  pool_size: 10

config :pastime, Pastime.BaseballRepo,
  username: "gregg",
  password: "",
  hostname: "localhost",
  database: "baseball_test#{System.get_env("MIX_TEST_PARTITION")}",
  pool: Ecto.Adapters.SQL.Sandbox,
  pool_size: 10

# We don't run a server during test. If one is required,
# you can enable the server option below.
config :pastime, PastimeWeb.Endpoint,
  http: [ip: {127, 0, 0, 1}, port: 4002],
  secret_key_base: "MVU+JwPvL0U8ST3hKnTaa+Ywb9bUXOYDkYWgq84qlnObmKgREDpF2B8bNiL7jQVY",
  server: false

# In test we don't send emails.
config :pastime, Pastime.Mailer, adapter: Swoosh.Adapters.Test

# Print only warnings and errors during test
config :logger, level: :warn

# Initialize plugs at runtime for faster test compilation
config :phoenix, :plug_init_mode, :runtime
