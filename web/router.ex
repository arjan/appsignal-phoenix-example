defmodule AppsignalPhoenixExample.Router do
  use AppsignalPhoenixExample.Web, :router

  pipeline :browser do
    use Appsignal.Phoenix
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", AppsignalPhoenixExample do
    pipe_through :browser # Use the default browser stack

    get "/", PageController, :index
  end

  # Other scopes may use custom stacks.
  # scope "/api", AppsignalPhoenixExample do
  #   pipe_through :api
  # end
end
