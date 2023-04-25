defmodule MostraPoa.Sessions.Session do
  use Ecto.Schema
  import Ecto.Changeset

  schema "sessions" do
    field :end, :naive_datetime
    field :location, :string
    field :name, :string
    field :start, :naive_datetime
    field :visible, :boolean, default: false

    timestamps()
  end

  @doc false
  def changeset(session, attrs) do
    session
    |> cast(attrs, [:name, :location, :start, :end, :visible])
    |> validate_required([:name, :location, :start, :end, :visible])
  end
end
