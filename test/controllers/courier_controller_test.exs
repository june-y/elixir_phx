defmodule Rxsystem.CourierControllerTest do
  use Rxsystem.ConnCase

  alias Rxsystem.Courier
  @valid_attrs %{address: "some address", name: "some name", pharmacies_serviced: []}
  @invalid_attrs %{}

  test "lists all entries on index", %{conn: conn} do
    conn = get conn, courier_path(conn, :index)
    assert html_response(conn, 200) =~ "Listing couriers"
  end

  test "renders form for new resources", %{conn: conn} do
    conn = get conn, courier_path(conn, :new)
    assert html_response(conn, 200) =~ "New courier"
  end

  test "creates resource and redirects when data is valid", %{conn: conn} do
    conn = post conn, courier_path(conn, :create), courier: @valid_attrs
    courier = Repo.get_by!(Courier, @valid_attrs)
    assert redirected_to(conn) == courier_path(conn, :show, courier.id)
  end

  test "does not create resource and renders errors when data is invalid", %{conn: conn} do
    conn = post conn, courier_path(conn, :create), courier: @invalid_attrs
    assert html_response(conn, 200) =~ "New courier"
  end

  test "shows chosen resource", %{conn: conn} do
    courier = Repo.insert! %Courier{}
    conn = get conn, courier_path(conn, :show, courier)
    assert html_response(conn, 200) =~ "Show courier"
  end

  test "renders page not found when id is nonexistent", %{conn: conn} do
    assert_error_sent 404, fn ->
      get conn, courier_path(conn, :show, -1)
    end
  end

  test "renders form for editing chosen resource", %{conn: conn} do
    courier = Repo.insert! %Courier{}
    conn = get conn, courier_path(conn, :edit, courier)
    assert html_response(conn, 200) =~ "Edit courier"
  end

  test "updates chosen resource and redirects when data is valid", %{conn: conn} do
    courier = Repo.insert! %Courier{}
    conn = put conn, courier_path(conn, :update, courier), courier: @valid_attrs
    assert redirected_to(conn) == courier_path(conn, :show, courier)
    assert Repo.get_by(Courier, @valid_attrs)
  end

  test "does not update chosen resource and renders errors when data is invalid", %{conn: conn} do
    courier = Repo.insert! %Courier{}
    conn = put conn, courier_path(conn, :update, courier), courier: @invalid_attrs
    assert html_response(conn, 200) =~ "Edit courier"
  end

  test "deletes chosen resource", %{conn: conn} do
    courier = Repo.insert! %Courier{}
    conn = delete conn, courier_path(conn, :delete, courier)
    assert redirected_to(conn) == courier_path(conn, :index)
    refute Repo.get(Courier, courier.id)
  end
end
