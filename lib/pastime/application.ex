defmodule Pastime.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      # Start the Ecto repository
      Pastime.Repo,
      Pastime.BaseballRepo,
      # Start the Telemetry supervisor
      PastimeWeb.Telemetry,
      # Start the PubSub system
      {Phoenix.PubSub, name: Pastime.PubSub},
      # Start the Endpoint (http/https)
      PastimeWeb.Endpoint
      # Start a worker by calling: Pastime.Worker.start_link(arg)
      # {Pastime.Worker, arg}
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: Pastime.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  @impl true
  def config_change(changed, _new, removed) do
    PastimeWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
