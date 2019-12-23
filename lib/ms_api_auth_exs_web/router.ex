defmodule MsApiAuthExsWeb.Router do
  use MsApiAuthExsWeb, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/api", MsApiAuthExsWeb do
    pipe_through :api

    post "/login", AuthController, :login
    resources "/users", UserController
  end
end
