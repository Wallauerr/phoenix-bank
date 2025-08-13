defmodule PhoenixBank.Users.Update do
  alias PhoenixBank.Repo
  alias PhoenixBank.Users.User

  def call(id) do
    case Repo.get(User, id) do
      nil -> {:error, :not_found}
      user -> {:ok, user}
    end
  end
end
