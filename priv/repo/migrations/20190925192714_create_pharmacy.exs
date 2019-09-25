defmodule Rxsystem.Repo.Migrations.CreatePharmacy do
  use Ecto.Migration

  def change do
    create table(:pharmacies) do
      add :name, :string
      add :address, :string

      timestamps()
    end
  end
end
