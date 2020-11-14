defmodule Easysubs.Repo do
  use Ecto.Repo,
    otp_app: :easysubs,
    adapter: Ecto.Adapters.Postgres
end
