defmodule PhoenixBankWeb.UsersControllerTest do
  use PhoenixBankWeb.ConnCase

  describe "create/2" do
    test "creates the user", %{conn: conn} do
      params = %{
        name: "John Doe",
        cep: "12345678",
        email: "john@example.com",
        password: "123456"
      }

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
  end
end
