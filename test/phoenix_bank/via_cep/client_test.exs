defmodule PhoenixBank.ViaCep.ClientTest do
  use ExUnit.Case, async: true

  alias PhoenixBank.ViaCep.Client

  setup do
    bypass = Bypass.open()
    {:ok, bypass: bypass}
  end

  describe "call/1" do
    test "succesfully return cep info", %{bypass: bypass} do
      cep = "93330370"

      body = ~s({
        "bairro": "Liberdade",
        "cep": "93330-370",
        "complemento": "",
        "ddd": "51",
        "estado": "Rio Grande do Sul",
        "gia": "",
        "ibge": "4313409",
        "localidade": "Novo Hamburgo",
        "logradouro": "Rua Corumbá",
        "regiao": "Sul",
        "siafi": "8771",
        "uf": "RS",
        "unidade": ""
      })

      expected_response = "test"

      Bypass.expect(bypass, fn conn ->
        Plug.Conn.resp(conn, 200, body)
      end)

      response =
        bypass.port
        |> endpoint_url()
        |> Client.call(cep)

      assert response == expected_response
    end
  end

  defp endpoint_url(port), do: "http://localhost:#{port}/"
end
