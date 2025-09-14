defmodule Mus.Repo do
  use Ecto.Repo,
    otp_app: :mus,
    adapter: Ecto.Adapters.Postgres
end
