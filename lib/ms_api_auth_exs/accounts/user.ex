defmodule MsApiAuthExs.Accounts.User do
  use Ecto.Schema
  import Ecto.Changeset

  schema "users" do
    field :crypted_password, :string
    field :email, :string
    # Virtual fields
    field :password, :string, virtual: true

    timestamps()
  end

  def changeset(user, attrs) do
    user
    |> cast(attrs, [:email, :password])
    |> validate_required([:email, :password])
    |> validate_format(:email, ~r/@/)
    |> validate_length(:password, min: 8)
    |> unique_constraint(:email)
    |> put_password_hash
  end

  defp put_password_hash(changeset) do
    case changeset do
      %Ecto.Changeset{valid?: true, changes: %{password: pass}} ->
        put_change(changeset, :crypted_password, Bcrypt.hash_pwd_salt(pass))
      _ ->
        changeset
    end
  end
end
