defmodule HelloPhoenix.LoginController do
  use HelloPhoenix.Web, :controller

  alias HelloPhoenix.Login

  def index(conn, _params) do
    login = Repo.all(Login)
    render(conn, "index.html", login: login)
  end

  def new(conn, _params) do
    changeset = Login.changeset(%Login{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"login" => login_params}) do
    raise login_params
    changeset = Login.changeset(%Login{}, login_params)

    case Repo.insert(changeset) do
      {:ok, _login} ->
        conn
        |> put_flash(:info, "Login created successfully.")
        |> redirect(to: login_path(conn, :index))
      {:error, changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    login = Repo.get!(Login, id)
    render(conn, "show.html", login: login)
  end

  def edit(conn, %{"id" => id}) do
    login = Repo.get!(Login, id)
    changeset = Login.changeset(login)
    render(conn, "edit.html", login: login, changeset: changeset)
  end

  def update(conn, %{"id" => id, "login" => login_params}) do
    login = Repo.get!(Login, id)
    changeset = Login.changeset(login, login_params)

    case Repo.update(changeset) do
      {:ok, login} ->
        conn
        |> put_flash(:info, "Login updated successfully.")
        |> redirect(to: login_path(conn, :show, login))
      {:error, changeset} ->
        render(conn, "edit.html", login: login, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    login = Repo.get!(Login, id)

    # Here we use delete! (with a bang) because we expect
    # it to always work (and if it does not, it will raise).
    Repo.delete!(login)

    conn
    |> put_flash(:info, "Login deleted successfully.")
    |> redirect(to: login_path(conn, :index))
  end
end
