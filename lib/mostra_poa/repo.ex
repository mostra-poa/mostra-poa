defmodule MostraPoa.Repo do
  use Ecto.Repo,
    otp_app: :mostra_poa,
    adapter: Ecto.Adapters.Postgres

  import Ecto.Query

  def all_visible(schema) do
    all(
      from s in schema,
        where: s.visible == true,
        select: %{s | visible: nil}
    )
  end
end
