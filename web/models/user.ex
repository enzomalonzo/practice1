defmodule HelloPhoenix.User do
  use HelloPhoenix.Web, :model

  schema "users" do
    field :username, :string
    field :password, :string
    
    has_many :posts, HelloPhoenix.Post

    timestamps()
  end

  @doc """
  Builds a changeset based on the `struct` and `params`.
  """
  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:username, :password])
    |> validate_required([:username, :password])
  end
end
