defmodule Rxsystem.OrderTest do
  use Rxsystem.ModelCase

  alias Rxsystem.Order

  @valid_attrs %{order_number: 42, patient_address: "some patient_address", patient_name: "some patient_name", pickup_date: ~D[2010-04-17], pickup_time: ~T[14:00:00.000000]}
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = Order.changeset(%Order{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = Order.changeset(%Order{}, @invalid_attrs)
    refute changeset.valid?
  end
end
