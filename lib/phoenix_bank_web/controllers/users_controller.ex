defmodule PhoenixBankWeb.UsersController do
  use PhoenixBankWeb, :controller

  alias PhoenixBank.Users.Create
  alias PhoenixBank.Users.User

  action_fallback PhoenixBankWeb.FallbackController

  def create(conn, params) do
    with {:ok, %User{} = user} <- Create.call(params) do
      conn
      |> put_status(:created)
      |> render(:create, user: user)
    end
  end
end
