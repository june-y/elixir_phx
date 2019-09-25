defmodule Rxsystem.CourierTest do
  use Rxsystem.ModelCase

  alias Rxsystem.Courier

  @valid_attrs %{address: "some address", name: "some name", pharmacies_serviced: []}
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = Courier.changeset(%Courier{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = Courier.changeset(%Courier{}, @invalid_attrs)
    refute changeset.valid?
  end
end
