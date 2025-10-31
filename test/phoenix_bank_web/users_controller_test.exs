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

    test "when there are invalid params", %{conn: conn} do
      params = %{
        name: nil,
        cep: "1234",
        email: "john@example.com",
        password: "123456"
      }

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
end
