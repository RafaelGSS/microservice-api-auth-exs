defmodule MsApiAuthExs.Repo do
  use Ecto.Repo,
    otp_app: :ms_api_auth_exs,
    adapter: Ecto.Adapters.Postgres
end
