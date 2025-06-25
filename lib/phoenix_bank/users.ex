defmodule PhoenixBank.Users do
  alias PhoenixBank.Users.Create

  defdelegate create(params), to: Create, as: :call
end
