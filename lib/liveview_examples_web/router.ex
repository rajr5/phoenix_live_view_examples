defmodule LiveviewExamplesWeb.Router do
  use LiveviewExamplesWeb, :router
  import Phoenix.LiveView.Router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_live_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :liveview_pipeline do
    plug :put_live_layout, {LiveviewExamplesWeb.LayoutView, "app.html"}
    # new version (0.9.1) will use this plug
    # plug :put_root_layout, LiveviewExamplesWeb.LayoutView
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", LiveviewExamplesWeb do
    pipe_through :browser

    get "/", PageController, :index
  end

  scope "/", LiveviewExamplesWeb do
    pipe_through([:browser, :liveview_pipeline])

    live "/search", SearchLive
    live "/clicker", SingleClickerLive
    live "/dynamic-clickers", DynamicClickersLive
  end

  # Other scopes may use custom stacks.
  # scope "/api", LiveviewExamplesWeb do
  #   pipe_through :api
  # end
end
