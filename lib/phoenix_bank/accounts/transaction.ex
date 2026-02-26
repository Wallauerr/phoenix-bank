defmodule PhoenixBank.Accounts.Transaction do
  import Ecto.Multi
  import Decimal

  alias PhoenixBank.Accounts
  alias Accounts.Account
  alias PhoenixBank.Repo

  def call(from_account_id, to_account_id, value) do
    with {:ok, %Account{} = from_account} <- Repo.get(Account, from_account_id),
         {:ok, %Account{} = to_account} <- Repo.get(Account, to_account_id) do
    else
      {:error, :not_found}
    end
  end
end
