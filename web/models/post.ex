defmodule HelloPhoenix.Post do
  use HelloPhoenix.Web, :model

  schema "posts" do
    field :status, :string

    belongs_to :user, HelloPhoenix.User

    timestamps()
  end

  @doc """
  Builds a changeset based on the `struct` and `params`.
  """
  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:user_id, :status])
    |> validate_required([:user_id, :status])
  end
end
