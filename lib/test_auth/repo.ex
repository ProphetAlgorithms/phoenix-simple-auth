defmodule TestAuth.Repo do
  use Ecto.Repo,
    otp_app: :test_auth,
    adapter: Ecto.Adapters.Postgres
end
