defmodule PhoenixBank.Users.Create do
  alias PhoenixBank.Repo
  alias PhoenixBank.Users.User
  alias PhoenixBank.ViaCep.Client, as: ViaCepClient

  def call(%{"cep" => cep} = params) do
    with {:ok, _result} <- ViaCepClient.call(cep) do
      params
      |> User.changeset()
      |> Repo.insert()
    end
  end
end
