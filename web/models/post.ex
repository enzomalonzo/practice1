defmodule HelloPhoenix.Post do
  use HelloPhoenix.Web, :model

  schema "posts" do
    field :entry, :string
    belongs_to :user, HelloPhoenix.User

    timestamps()
  end

  @doc """
  Builds a changeset based on the `struct` and `params`.
  """
  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:username])
    |> validate_required([:username])
    
  end
end
