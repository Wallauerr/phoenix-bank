defmodule PhoenixBankWeb.WelcomeController do
  use PhoenixBankWeb, :controller

  def index(conn, _params) do
    conn
    |> put_status(:ok)
    |> json(%{message: "Welcome to Phoenix Bank!"})
  end
end
