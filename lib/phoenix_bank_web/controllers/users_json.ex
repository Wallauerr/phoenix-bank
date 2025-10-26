defmodule PhoenixBankWeb.UsersJSON do
  alias PhoenixBank.Users.User

  def create(%{user: user}) do
    %{
      message: "Usuário criado com sucesso!",
      data: data(user)
    }
  end

  def get(%{user: user}), do: %{data: data(user)}
  def update(%{user: user}), do: %{message: "Usuário atualizado com sucesso!", data: data(user)}

  defp data(%User{} = user) do
    %{
      id: user.id,
      name: user.name,
      email: user.email,
      cep: user.cep
    }
  end
end
