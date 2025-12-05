defmodule PhoenixBank.Accounts.Create do
  alias PhoenixBank.Repo
  alias PhoenixBank.Accounts.Account

  def call(params) do
    params
    |> Account.changeset()
    |> Repo.insert()
  end
end
