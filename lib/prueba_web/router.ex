defmodule PruebaWeb.Router do
  use PruebaWeb, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_live_flash
    plug :put_root_layout, html: {PruebaWeb.Layouts, :root}
    #plug :protect_from_forgery, except: [:incrementar]
    plug :put_secure_browser_headers
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", PruebaWeb do
    pipe_through :browser

    get "/", PageController, :home
    get "/boton", PageController, :boton
    get "/valor", PageController, :valor
    post "/incrementar", PageController, :incrementar
  end

  # Other scopes may use custom stacks.
  # scope "/api", PruebaWeb do
  #   pipe_through :api
  # end

  # Enable LiveDashboard in development
  if Application.compile_env(:prueba, :dev_routes) do
    # If you want to use the LiveDashboard in production, you should put
    # it behind authentication and allow only admins to access it.
    # If your application does not have an admins-only section yet,
    # you can use Plug.BasicAuth to set up some basic authentication
    # as long as you are also using SSL (which you should anyway).
    import Phoenix.LiveDashboard.Router

    scope "/dev" do
      pipe_through :browser

      live_dashboard "/dashboard", metrics: PruebaWeb.Telemetry
    end
  end
end
