defmodule HelloPhoenix.Repo.Migrations.CreateLogin do
  use Ecto.Migration

  def change do
    create table(:login) do
      add :username, :string
      add :password, :string

      timestamps()
    end

  end
end
