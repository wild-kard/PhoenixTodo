defmodule LiveTest.Repo do
  use Ecto.Repo,
    otp_app: :live_test,
    adapter: Ecto.Adapters.Postgres
end
