defmodule PastimeWeb.Router do
  use PastimeWeb, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_live_flash
    plug :put_root_layout, {PastimeWeb.LayoutView, :root}
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", PastimeWeb do
    pipe_through :browser

    get "/", PageController, :index

    resources "/players", PlayerController, only: [:index, :show]
    resources "/teams", TeamController, only: [:index, :show]
    resources "/franchises", FranchiseController, only: [:index, :show]
    resources "/parks", ParkController, only: [:index, :show]
    resources "/managers", ManagerController, only: [:index, :show]
    resources "/leagues", LeagueController, only: [:index, :show]
  end

  # Other scopes may use custom stacks.
  # scope "/api", PastimeWeb do
  #   pipe_through :api
  # end

  # Enables LiveDashboard only for development
  #
  # If you want to use the LiveDashboard in production, you should put
  # it behind authentication and allow only admins to access it.
  # If your application does not have an admins-only section yet,
  # you can use Plug.BasicAuth to set up some basic authentication
  # as long as you are also using SSL (which you should anyway).
  if Mix.env() in [:dev, :test] do
    import Phoenix.LiveDashboard.Router

    scope "/" do
      pipe_through :browser

      live_dashboard "/dashboard", metrics: PastimeWeb.Telemetry
    end
  end

  # Enables the Swoosh mailbox preview in development.
  #
  # Note that preview only shows emails that were sent by the same
  # node running the Phoenix server.
  if Mix.env() == :dev do
    scope "/dev" do
      pipe_through :browser

      forward "/mailbox", Plug.Swoosh.MailboxPreview
    end
  end
end
