defmodule RxsystemWeb.Router do
  use RxsystemWeb, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", RxsystemWeb do
    pipe_through :browser # Use the default browser stack

    get "/", PageController, :index




    resources "/user_types", UserTypeController
    resources "/users", UserController
    resources "/pharmacies", PharmacyController
    resources "/couriers", CourierController
    resources "/orders", OrderController
  end





  # Other scopes may use custom stacks.
  # scope "/api", RxsystemWeb do
  #   pipe_through :api
  # end
end
