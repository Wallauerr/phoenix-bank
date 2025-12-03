defmodule PhoenixBank.Repo.Migrations.AddAccountsTable do
  use Ecto.Migration

  def change do
    add :balance, :decimal
    add :user_id, references(:users)

    timestamps()
  end
end
