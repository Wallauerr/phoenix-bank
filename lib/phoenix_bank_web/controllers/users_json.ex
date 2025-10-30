defmodule PhoenixBankWeb.UsersJSON do
  alias PhoenixBank.Users.User

  def create(%{user: user}) do
    %{
      message: "User created successfully",
      data: data(user)
    }
  end

  def delete(%{user: user}), do: %{data: data(user)}
  def get(%{user: user}), do: %{data: data(user)}
  def update(%{user: user}), do: %{message: "User updated successfully", data: data(user)}

  defp data(%User{} = user) do
    %{
      id: user.id,
      name: user.name,
      email: user.email,
      cep: user.cep
    }
  end
end
