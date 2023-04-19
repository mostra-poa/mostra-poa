defmodule MostraPoa.Repo.Migrations.CreateSessions do
  use Ecto.Migration

  def change do
    create table(:sessions) do
      add :name, :string
      add :location, :string
      add :start, :naive_datetime
      add :end, :naive_datetime
      add :visible, :boolean, default: false, null: false

      timestamps()
    end
  end
end
