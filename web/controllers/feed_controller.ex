defmodule HelloPhoenix.FeedController do
  use HelloPhoenix.Web, :controller
  

  def index(conn, %{"user" => user}) do
    render conn, "index.html", user: user 
  end

end
