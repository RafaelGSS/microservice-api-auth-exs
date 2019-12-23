defmodule MsApiAuthExsWeb.AuthView do
  use MsApiAuthExsWeb, :view

  def render("jwt.json", %{jwt: jwt}) do
    %{jwt: jwt}
  end
end
