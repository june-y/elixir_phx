defmodule Rxsystem.Repo.Migrations.CreateUsers do
  use Ecto.Migration

  def change do
    create table(:users) do
      add :name, :string
      add :encrypted_password, :string
      add :user_type_id, references(:user_types, on_delete: :nothing)

      timestamps()
    end

    create index(:users, [:user_type_id])
  end
end
