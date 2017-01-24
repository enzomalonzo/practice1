defmodule HelloPhoenix.Router do
  use HelloPhoenix.Web, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", HelloPhoenix do
    pipe_through :browser # Use the default browser stack

    get "/", PageController, :index
    get "/hello", HelloController, :index
    get "/hello/:messenger", HelloController, :show
    get "/feed/:user", FeedController, :index     

    # Public Login Route
    get "/sign_in", SessionController, :new
    post "/sign_in", SessionController, :create

    get "/dashboard", DashboardController, :index

    get "/posts/new", PostController, :new
    post "/posts/new", PostController, :create

    get "/posts", PostController, :index

    # TODO: Add here route for registration controller
    # get "/register", RegistrationController, :new
    # post "/register", RegistrationController, :create

    resources "/users", UserController # User Management for Admin
    resources "/login", LoginController

    # RESOURCES:
    # get "/login", LoginContrller, :new
    # post "/login", LoginContrller, :creat
    # get "/edit", LoginContrller, :edit
    # put "/edit", LoginContrller, :update

  end

  # Other scopes may use custom stacks
  # scope "/api", HelloPhoenix do
  #   pipe_through :api
  # end
end
