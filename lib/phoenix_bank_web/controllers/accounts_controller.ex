defmodule PhoenixBankWeb.AccountsController do
  use PhoenixBankWeb, :controller

  alias PhoenixBank.Accounts
  alias Accounts.Account

  action_fallback PhoenixBankWeb.FallbackController

  def create(conn, params) do
    with {:ok, %Account{} = account} <- Accounts.create(params) do
      conn
      |> put_status(:created)
      |> render(:create, account: account)
    end
  end
end
