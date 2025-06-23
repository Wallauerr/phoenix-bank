defmodule PhoenixBankWeb.UsersController do
  use PhoenixBankWeb, :controller

  alias PhoenixBank.Users.Create

  def create(conn, params) do
    params
    |> Create.call()
    |> handle_response(conn)
  end

  defp handle_response({:ok, user}, conn) do
    conn
    |> put_status(:created)
    |> render(:create, user: user)
  end

  defp handle_response({:error, changeset}, conn) do
    conn
    |> put_status(:bad_request)
    |> put_view(json: PhoenixBankWeb.ErrorJSON)
    |> render(:error, changeset: changeset)
  end
end
