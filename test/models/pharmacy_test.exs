defmodule Rxsystem.PharmacyTest do
  use Rxsystem.ModelCase

  alias Rxsystem.Pharmacy

  @valid_attrs %{address: "some address", name: "some name"}
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = Pharmacy.changeset(%Pharmacy{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = Pharmacy.changeset(%Pharmacy{}, @invalid_attrs)
    refute changeset.valid?
  end
end
