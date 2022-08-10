defmodule Financer.Repo do
  use Ecto.Repo,
    otp_app: :financer,
    adapter: Ecto.Adapters.Postgres
end
