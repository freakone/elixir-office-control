ExUnit.start

Mix.Task.run "ecto.create", ~w(-r OfficeElixir.Repo --quiet)
Mix.Task.run "ecto.migrate", ~w(-r OfficeElixir.Repo --quiet)
Ecto.Adapters.SQL.begin_test_transaction(OfficeElixir.Repo)

