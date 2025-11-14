Mox.defmock(PhoenixBank.ViaCep.ClientMock, for: PhoenixBank.ViaCep.ClientBehaviour)
Application.put_env(:phoenix_bank, :via_cep_client, PhoenixBank.ViaCep.ClientMock)

ExUnit.start()
Ecto.Adapters.SQL.Sandbox.mode(PhoenixBank.Repo, :manual)
