defmodule PhoenixBank.Accounts.Transaction do
  import Ecto.Multi
  import Decimal

  alias PhoenixBank.Accounts
  alias Accounts.Account
  alias PhoenixBank.Repo

  def call(from_account_id, to_account_id, value) do
    with {}
  end
end
