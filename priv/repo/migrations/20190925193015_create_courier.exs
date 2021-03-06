defmodule Rxsystem.Repo.Migrations.CreateCourier do
  use Ecto.Migration

  def change do
    create table(:couriers) do
      add :name, :string
      add :address, :text
      add :pharmacies_serviced, {:array, :string}

      timestamps()
    end
  end
end
