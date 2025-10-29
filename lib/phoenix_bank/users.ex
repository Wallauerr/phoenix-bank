defmodule PhoenixBank.Users do
  alias PhoenixBank.Users.Create
  alias PhoenixBank.Users.Delete
  alias PhoenixBank.Users.Get
  alias PhoenixBank.Users.Update

  defdelegate create(params), to: Create, as: :call
  defdelegate delete(id), to: Delete, as: :call
  defdelegate get(id), to: Get, as: :call
  defdelegate update(params), to: Update, as: :call
end
