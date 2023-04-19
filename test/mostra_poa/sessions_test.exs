defmodule MostraPoa.SessionsTest do
  use MostraPoa.DataCase

  alias MostraPoa.Sessions

  describe "sessions" do
    alias MostraPoa.Sessions.Session

    import MostraPoa.SessionsFixtures

    @invalid_attrs %{end: nil, location: nil, name: nil, start: nil, visible: nil}

    test "list_sessions/0 returns all sessions" do
      session = session_fixture()
      assert Sessions.list_sessions() == [session]
    end

    test "get_session!/1 returns the session with given id" do
      session = session_fixture()
      assert Sessions.get_session!(session.id) == session
    end

    test "create_session/1 with valid data creates a session" do
      valid_attrs = %{end: ~N[2023-04-18 23:04:00], location: "some location", name: "some name", start: ~N[2023-04-18 23:04:00], visible: true}

      assert {:ok, %Session{} = session} = Sessions.create_session(valid_attrs)
      assert session.end == ~N[2023-04-18 23:04:00]
      assert session.location == "some location"
      assert session.name == "some name"
      assert session.start == ~N[2023-04-18 23:04:00]
      assert session.visible == true
    end

    test "create_session/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Sessions.create_session(@invalid_attrs)
    end

    test "update_session/2 with valid data updates the session" do
      session = session_fixture()
      update_attrs = %{end: ~N[2023-04-19 23:04:00], location: "some updated location", name: "some updated name", start: ~N[2023-04-19 23:04:00], visible: false}

      assert {:ok, %Session{} = session} = Sessions.update_session(session, update_attrs)
      assert session.end == ~N[2023-04-19 23:04:00]
      assert session.location == "some updated location"
      assert session.name == "some updated name"
      assert session.start == ~N[2023-04-19 23:04:00]
      assert session.visible == false
    end

    test "update_session/2 with invalid data returns error changeset" do
      session = session_fixture()
      assert {:error, %Ecto.Changeset{}} = Sessions.update_session(session, @invalid_attrs)
      assert session == Sessions.get_session!(session.id)
    end

    test "delete_session/1 deletes the session" do
      session = session_fixture()
      assert {:ok, %Session{}} = Sessions.delete_session(session)
      assert_raise Ecto.NoResultsError, fn -> Sessions.get_session!(session.id) end
    end

    test "change_session/1 returns a session changeset" do
      session = session_fixture()
      assert %Ecto.Changeset{} = Sessions.change_session(session)
    end
  end
end
