defmodule Rxsystem.CourierController do
  use Rxsystem.Web, :controller

  alias Rxsystem.Courier

  def index(conn, _params) do
    couriers = Repo.all(Courier)
    render(conn, "index.html", couriers: couriers)
  end

  def new(conn, _params) do
    changeset = Courier.changeset(%Courier{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"courier" => courier_params}) do
    changeset = Courier.changeset(%Courier{}, courier_params)

    case Repo.insert(changeset) do
      {:ok, courier} ->
        conn
        |> put_flash(:info, "Courier created successfully.")
        |> redirect(to: courier_path(conn, :show, courier))
      {:error, changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    courier = Repo.get!(Courier, id)
    render(conn, "show.html", courier: courier)
  end

  def edit(conn, %{"id" => id}) do
    courier = Repo.get!(Courier, id)
    changeset = Courier.changeset(courier)
    render(conn, "edit.html", courier: courier, changeset: changeset)
  end

  def update(conn, %{"id" => id, "courier" => courier_params}) do
    courier = Repo.get!(Courier, id)
    changeset = Courier.changeset(courier, courier_params)

    case Repo.update(changeset) do
      {:ok, courier} ->
        conn
        |> put_flash(:info, "Courier updated successfully.")
        |> redirect(to: courier_path(conn, :show, courier))
      {:error, changeset} ->
        render(conn, "edit.html", courier: courier, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    courier = Repo.get!(Courier, id)

    # Here we use delete! (with a bang) because we expect
    # it to always work (and if it does not, it will raise).
    Repo.delete!(courier)

    conn
    |> put_flash(:info, "Courier deleted successfully.")
    |> redirect(to: courier_path(conn, :index))
  end
end
