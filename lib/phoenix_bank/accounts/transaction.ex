defmodule PhoenixBank.Accounts.Transaction do
  import Ecto.Multi

  alias PhoenixBank.Accounts.Account
  alias PhoenixBank.Repo
  alias Accounts.Account

  def call(from_account_id, to_account_id, value) do
    with {}
  end
end
