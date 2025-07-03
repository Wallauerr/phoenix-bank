defmodule PhoenixBank.Users do
  alias PhoenixBank.Users.Create
  alias PhoenixBank.Users.Get

  defdelegate create(params), to: Create, as: :call
  defdelegate get(id), to: Get, as: :call
end
