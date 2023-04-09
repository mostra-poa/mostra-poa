defmodule MostraPoaWeb.Router do
  use MostraPoaWeb, :router
  use Pow.Phoenix.Router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_live_flash
    plug :put_root_layout, {MostraPoaWeb.Layouts, :root}
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  pipeline :api_protected do
    plug Pow.Plug.RequireAuthenticated, error_handler: MostraPoaWeb.ApiAuthErrorHandler
  end

  scope "/" do
    pipe_through :browser

    pow_routes()
  end

  scope "/", MostraPoaWeb do
    pipe_through :browser

    get "/", PageController, :home
  end

  scope "/app", MostraPoaWeb do
    get "/", WebappController, :index
    get "/*path", WebappController, :index
  end

  scope "/api", MostraPoaWeb do
    pipe_through :api

    resources "/registration", RegistrationController, singleton: true, only: [:create]
    resources "/session", SessionController, singleton: true, only: [:create, :delete]
    post "/session/renew", SessionController, :renew
  end

  scope "/api", MostraPoaWeb do
    pipe_through [:api, :api_protected]
    resources "/posts", PostController, except: [:new, :edit, :show, :index]
  end

  scope "/api", MostraPoaWeb do
    pipe_through :api
    resources "/posts", PostController, except: [:new, :edit]
  end

  # Enable LiveDashboard and Swoosh mailbox preview in development
  if Application.compile_env(:mostra_poa, :dev_routes) do
    # If you want to use the LiveDashboard in production, you should put
    # it behind authentication and allow only admins to access it.
    # If your application does not have an admins-only section yet,
    # you can use Plug.BasicAuth to set up some basic authentication
    # as long as you are also using SSL (which you should anyway).
    import Phoenix.LiveDashboard.Router

    scope "/dev" do
      pipe_through :browser

      live_dashboard "/dashboard", metrics: MostraPoaWeb.Telemetry
      forward "/mailbox", Plug.Swoosh.MailboxPreview
    end
  end
end
