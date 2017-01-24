defmodule HelloPhoenix.SessionController do
  use HelloPhoenix.Web, :controller

  alias HelloPhoenix.User

  def new(conn, _params) do
    changeset = User.changeset(%User{})

    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"user" => user_params}) do
    case Repo.get_by(User, username: user_params["username"], password: user_params["password"]) do
      nil ->
        conn
        |> put_flash(:error, "Invalid username/password.")
        |> redirect(to: session_path(conn, :new))
      user ->
        conn
        |> put_session(:current_user, user)
        |> redirect(to: post_path(conn, :new))
    end
  end
end
