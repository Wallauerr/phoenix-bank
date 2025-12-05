defmodule PhoenixBank.Accounts do
  alias PhoenixBank.Accounts.Create

  defdelegate create(params), to: Create, as: :call
end
