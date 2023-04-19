defmodule MostraPoa.SessionsFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `MostraPoa.Sessions` context.
  """

  @doc """
  Generate a session.
  """
  def session_fixture(attrs \\ %{}) do
    {:ok, session} =
      attrs
      |> Enum.into(%{
        end: ~N[2023-04-18 23:04:00],
        location: "some location",
        name: "some name",
        start: ~N[2023-04-18 23:04:00],
        visible: true
      })
      |> MostraPoa.Sessions.create_session()

    session
  end
end
