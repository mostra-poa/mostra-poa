defmodule MostraPoa.Repo do
  use Ecto.Repo,
    otp_app: :mostra_poa,
    adapter: Ecto.Adapters.Postgres
end
