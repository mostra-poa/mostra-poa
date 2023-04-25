defmodule MostraPoaWeb.RegistrationController do
  use MostraPoaWeb, :controller

  alias Plug.Conn

  @spec create(Conn.t(), map()) :: Conn.t()
  def create(conn, %{"user" => user_params}) do
    conn
    |> Pow.Plug.create_user(user_params)
    |> case do
      {:ok, _user, conn} ->
        json(conn, %{
          data: %{
            access_token: conn.private.api_access_token,
            renewal_token: conn.private.api_renewal_token
          }
        })

      {:error, changeset, conn} ->
        conn
        |> put_status(500)
        |> json(%{error: MostraPoaWeb.ChangesetJSON.error(%{changeset: changeset})})
    end
  end
end
