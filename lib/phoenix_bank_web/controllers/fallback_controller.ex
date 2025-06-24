defmodule PhoenixBankWeb.FallbackController do
  use PhoenixBankWeb, :controller

  def call(conn, {:error, changeset}) do
    conn
    |> put_status(:bad_request)
    |> put_view(json: PhoenixBankWeb.ErrorJSON)
    |> render(:error, changeset: changeset)
  end
end
