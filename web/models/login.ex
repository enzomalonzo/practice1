defmodule HelloPhoenix.Login do
  use HelloPhoenix.Web, :model

  schema "login" do
    field :username, :string
    field :password, :string

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
