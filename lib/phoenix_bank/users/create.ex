defmodule PhoenixBank.Users.Create do
  alias PhoenixBank.Repo
  alias PhoenixBank.Users.User

  def call(params) do
    params
    |> User.changeset()
    |> Repo.insert()
  end
end
