defmodule HelloPhoenix.PostController do
  use HelloPhoenix.Web, :controller

  alias HelloPhoenix.Post

  def index(conn, _params) do
    current_user =
      conn
      |> get_session(:current_user)
      |> Repo.preload(:posts)

    posts = current_user.posts

    raise posts
  end

  def new(conn, _params) do
    changeset = Post.changeset(%Post{})

    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"post" => post_params}) do
    current_user = get_session(conn, :current_user)

    params = %{
      user_id: current_user.id,
      status: post_params["status"]
    }
    changeset = Post.changeset(%Post{}, params)

    case Repo.insert(changeset) do
      {:ok, post} ->
        conn
        |> put_flash(:info, "Successfully created post.")
        |> redirect(to: post_path(conn, :index))
      {:error, changeset} ->
        conn
        |> render("new.html", changeset: changeset)
    end
  end
end
