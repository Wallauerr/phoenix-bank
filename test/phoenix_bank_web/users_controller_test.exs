defmodule PhoenixBankWeb.UsersControllerTest do
  use PhoenixBankWeb.ConnCase

  import Mox

  alias PhoenixBank.Users
  alias Users.User

  setup :verify_on_exit!

  describe "create/2" do
    test "creates the user", %{conn: conn} do
      params = %{
        "name" => "John Doe",
        "cep" => "93330370",
        "email" => "john@example.com",
        "password" => "123456"
      }

      body = %{
        "bairro" => "Liberdade",
        "cep" => "93330-370",
        "complemento" => "",
        "ddd" => "51",
        "estado" => "Rio Grande do Sul",
        "gia" => "",
        "ibge" => "4313409",
        "localidade" => "Novo Hamburgo",
        "logradouro" => "Rua Corumbá",
        "regiao" => "Sul",
        "siafi" => "8771",
        "uf" => "RS",
        "unidade" => ""
      }

      expect(PhoenixBank.ViaCep.ClientMock, :call, fn "12345678" ->
        {:ok, body}
      end)

      response =
        conn
        |> post(~p"/api/users", params)
        |> json_response(:created)

      assert %{
               "data" => %{
                 "id" => _id,
                 "name" => "John Doe",
                 "cep" => "12345678",
                 "email" => "john@example.com"
               },
               "message" => "User created successfully"
             } = response
    end

    test "when there are invalid params", %{conn: conn} do
      params = %{
        name: nil,
        cep: "1234",
        email: "john@example.com",
        password: "123456"
      }

      expect(PhoenixBank.ViaCep.ClientMock, :call, fn "1234" ->
        {:ok, ""}
      end)

      response =
        conn
        |> post(~p"/api/users", params)
        |> json_response(:bad_request)

      expected_response = %{
        "errors" => %{"cep" => ["should be 8 character(s)"], "name" => ["can't be blank"]}
      }

      assert response == expected_response
    end
  end

  describe "delete/2" do
    test "deletes the user", %{conn: conn} do
      params = %{
        "name" => "John Doe",
        "cep" => "93330370",
        "email" => "john@example.com",
        "password" => "123456"
      }

      body = %{
        "bairro" => "Liberdade",
        "cep" => "93330-370",
        "complemento" => "",
        "ddd" => "51",
        "estado" => "Rio Grande do Sul",
        "gia" => "",
        "ibge" => "4313409",
        "localidade" => "Novo Hamburgo",
        "logradouro" => "Rua Corumbá",
        "regiao" => "Sul",
        "siafi" => "8771",
        "uf" => "RS",
        "unidade" => ""
      }

      expect(PhoenixBank.ViaCep.ClientMock, :call, fn "93330370" ->
        {:ok, body}
      end)

      {:ok, %User{id: id}} = Users.create(params)

      response =
        conn
        |> delete(~p"/api/users/#{id}")
        |> json_response(:ok)

      expected_response = %{
        "data" => %{
          "id" => id,
          "name" => "John Doe",
          "cep" => "93330370",
          "email" => "john@example.com"
        }
      }

      assert response == expected_response
    end
  end
end
