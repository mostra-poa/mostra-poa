defmodule MostraPoa.Blog.Post do
  use Ecto.Schema
  import Ecto.Changeset

  schema "posts" do
    field :body, :string
    field :title, :string
    field :visible, :boolean, default: false

    timestamps()
  end

  @doc false
  def changeset(post, attrs) do
    post
    |> cast(attrs, [:title, :body, :visible])
    |> validate_required([:title, :body, :visible])
  end
end
