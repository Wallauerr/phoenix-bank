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

      expected_response = "test"

      Bypass.expect(bypass, fn conn ->
        Plug.Conn.resp(conn, 200, "")
      end)

      response = Client.call(cep)

      assert response == expected_response
    end
  end
end
