defmodule PhoenixBank.Accounts.Account do
  use Ecto.Schema
  import Ecto.Changeset

  alias PhoenixBank.Users.User

  @required_params [:balance, :user_id]

  schema "accounts" do
    field :balance, :decimal
    belongs_to :user, User

    timestamps()
  end
end
