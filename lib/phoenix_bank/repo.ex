defmodule PhoenixBank.Repo do
  use Ecto.Repo,
    otp_app: :phoenix_bank,
    adapter: Ecto.Adapters.Postgres
end
