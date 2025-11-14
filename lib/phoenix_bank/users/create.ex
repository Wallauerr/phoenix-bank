defmodule PhoenixBank.Users.Create do
  alias PhoenixBank.Repo
  alias PhoenixBank.Users.User
  alias PhoenixBank.ViaCep.Client, as: ViaCepClient

  def call(%{"cep" => cep} = params) do
    with {:ok, _result} <- client().call(cep) do
      params
      |> User.changeset()
      |> Repo.insert()
    end
  end

  defp client() do
    Application.get_env(:phoenix_bank, :via_cep_client, ViaCepClient)
  end
end
