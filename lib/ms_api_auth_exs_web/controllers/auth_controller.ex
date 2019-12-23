defmodule MsApiAuthExsWeb.AuthController do
  use MsApiAuthExsWeb, :controller
  alias MsApiAuthExs.Accounts

  def login(conn, %{"email" => email, "password" => password}) do
    case Accounts.token_sign_in(email, password) do
      {:ok, token, _claims} ->
        render(conn, "jwt.json", jwt: token)
      _ ->
        {:error, :unauthorized}
    end
  end
end
