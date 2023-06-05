defmodule MostraPoaWeb.SessionJSON do
  alias MostraPoa.Sessions.Session

  @doc """
  Renders a list of sessions.
  """
  def index(%{sessions: sessions}) do
    %{data: for(session <- sessions, do: data(session))}
  end

  @doc """
  Renders a single session.
  """
  def show(%{session: session}) do
    %{data: data(session)}
  end

  defp data(%Session{} = session) do
    %{
      id: session.id,
      name: session.name,
      location: session.location,
      start: session.start,
      end: session.end
    }
  end
end
