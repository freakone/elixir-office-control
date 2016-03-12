defmodule OfficeElixir.LightTest do
  use OfficeElixir.ModelCase

  alias OfficeElixir.Light

  @valid_attrs %{address: 42, description: "some content", index: 42, state: true, zone: "some content"}
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = Light.changeset(%Light{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = Light.changeset(%Light{}, @invalid_attrs)
    refute changeset.valid?
  end
end
