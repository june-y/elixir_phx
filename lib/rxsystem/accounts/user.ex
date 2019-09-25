defmodule Rxsystem.Accounts.User do
  use Ecto.Schema
  import Ecto.Changeset


  schema "users" do
    field :encrypted_password, :string
    field :name, :string
    field :user_type_id, :id

    timestamps()
  end

  @doc false
  def changeset(user, attrs) do
    user
    |> cast(attrs, [:name, :encrypted_password])
    |> validate_required([:name, :encrypted_password])
  end
end
