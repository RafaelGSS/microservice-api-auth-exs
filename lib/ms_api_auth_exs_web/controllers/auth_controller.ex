defmodule MsApiAuthExsWeb.AuthController do
  use MsApiAuthExsWeb, :controller

  def index(conn, _params) do
    json(conn, %{
      example: "ok"
    })
  end
end
