defmodule HelloPhoenix.LoginTest do
  use HelloPhoenix.ModelCase

  alias HelloPhoenix.Login

  @valid_attrs %{password: "some content", username: "some content"}
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = Login.changeset(%Login{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = Login.changeset(%Login{}, @invalid_attrs)
    refute changeset.valid?
  end
end
