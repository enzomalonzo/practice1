defmodule HelloPhoenix.DashboardController do
  use HelloPhoenix.Web, :controller

  def index(conn, _params) do
    user = get_session(conn, :current_user)
    render conn, "index.html", user: user
  end
end
