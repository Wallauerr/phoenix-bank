defmodule PhoenixBank.Users.Create do
  alias PhoenixBank.{Repo, Users.User}

  def call(params) do
    params
    |> User.changeset()
    |> Repo.insert()
  end
end
