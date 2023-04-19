defmodule MostraPoaWeb.SessionControllerTest do
  use MostraPoaWeb.ConnCase

  import MostraPoa.SessionsFixtures

  alias MostraPoa.Sessions.Session

  @create_attrs %{
    end: ~N[2023-04-18 23:04:00],
    location: "some location",
    name: "some name",
    start: ~N[2023-04-18 23:04:00],
    visible: true
  }
  @update_attrs %{
    end: ~N[2023-04-19 23:04:00],
    location: "some updated location",
    name: "some updated name",
    start: ~N[2023-04-19 23:04:00],
    visible: false
  }
  @invalid_attrs %{end: nil, location: nil, name: nil, start: nil, visible: nil}

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  describe "index" do
    test "lists all sessions", %{conn: conn} do
      conn = get(conn, ~p"/api/sessions")
      assert json_response(conn, 200)["data"] == []
    end
  end

  describe "create session" do
    test "renders session when data is valid", %{conn: conn} do
      conn = post(conn, ~p"/api/sessions", session: @create_attrs)
      assert %{"id" => id} = json_response(conn, 201)["data"]

      conn = get(conn, ~p"/api/sessions/#{id}")

      assert %{
               "id" => ^id,
               "end" => "2023-04-18T23:04:00",
               "location" => "some location",
               "name" => "some name",
               "start" => "2023-04-18T23:04:00",
               "visible" => true
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, ~p"/api/sessions", session: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "update session" do
    setup [:create_session]

    test "renders session when data is valid", %{conn: conn, session: %Session{id: id} = session} do
      conn = put(conn, ~p"/api/sessions/#{session}", session: @update_attrs)
      assert %{"id" => ^id} = json_response(conn, 200)["data"]

      conn = get(conn, ~p"/api/sessions/#{id}")

      assert %{
               "id" => ^id,
               "end" => "2023-04-19T23:04:00",
               "location" => "some updated location",
               "name" => "some updated name",
               "start" => "2023-04-19T23:04:00",
               "visible" => false
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn, session: session} do
      conn = put(conn, ~p"/api/sessions/#{session}", session: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "delete session" do
    setup [:create_session]

    test "deletes chosen session", %{conn: conn, session: session} do
      conn = delete(conn, ~p"/api/sessions/#{session}")
      assert response(conn, 204)

      assert_error_sent 404, fn ->
        get(conn, ~p"/api/sessions/#{session}")
      end
    end
  end

  defp create_session(_) do
    session = session_fixture()
    %{session: session}
  end
end
