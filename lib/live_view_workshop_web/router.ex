defmodule LiveViewWorkshopWeb.Router do
  use LiveViewWorkshopWeb, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_live_flash
    plug :put_root_layout, {LiveViewWorkshopWeb.LayoutView, :root}
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", LiveViewWorkshopWeb do
    pipe_through :browser

    live "/", HomeLive, :index
    live "/workshop_goals", WorkshopGoalsLive, :index
    live "/liveview_overview", LiveviewOverviewLive, :index
    live "/what_is_phoenix_liveview_is_not_for", WhatIsPhoenixLiveviewIsNotForLive, :index
    live "/what_is_phoenix_liveview_is_for", WhatIsPhoenixLiveviewIsForLive, :index
    live "/the_simplest_liveview", TheSimplestLiveviewLive, :index
    live "/about_heex", AboutHeexLive, :index
    live "/liveview_callbacks", LiveviewCallbacksLive, :index
    live "/exercise_1", Exercise1Live, :index
    live "/exercise_1_possible_solution", Exercise1PossibleSolutionLive, :index
    live "/exercise_2", Exercise2Live, :index
    live "/exercise_2_possible_solution", Exercise2PossibleSolutionLive, :index
    live "/exercise_3", Exercise3Live, :index
    live "/exercise_3_possible_solution", Exercise3PossibleSolutionLive, :index
    live "/the_deploy_problem", TheDeployProblemLive, :index
    live "/exercise_4", Exercise4Live, :index
    live "/exercise_4_possible_solution", Exercise4PossibleSolutionLive, :index
    live "/exercise_4_possible_solution/:tab", Exercise4PossibleSolutionLive, :index
    live "/plans_for_next", PlansForNextLive, :index
  end

  # Other scopes may use custom stacks.
  # scope "/api", LiveViewWorkshopWeb do
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

      live_dashboard "/dashboard", metrics: LiveViewWorkshopWeb.Telemetry
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
