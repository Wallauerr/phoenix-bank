defmodule PhoenixBank.Users.User do
  use Ecto.Schema
  import Ecto.Changeset

  schema "users" do
    field :name, :string
    field :password_hash, :string
    field :email, :string
    field :cep, :string

    timestamps()
  end

  def changeset(user \\ %__MODULE__{}, params) do
    user
    |> cast(params, [:name, :password_hash, :email, :cep])
    |> validate_required([:name, :password_hash, :email, :cep])
    |> validate_length(:name, min: 3)
    |> validate_length(:cep, is: 8)
    |> validate_format(:email, ~r/@/)
  end
end
