defmodule Rxsystem.Repo.Migrations.CreateOrder do
  use Ecto.Migration

  def change do
    create table(:orders) do
      add :order_number, :integer
      add :patient_name, :string
      add :patient_address, :text
      add :pickup_date, :date
      add :pickup_time, :time

      timestamps()
    end
  end
end
