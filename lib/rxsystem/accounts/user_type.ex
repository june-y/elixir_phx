defmodule Rxsystem.Accounts.UserType do
  use Ecto.Schema
  import Ecto.Changeset


  schema "user_types" do
    field :actions, {:array, :string}
    field :type, :string

    timestamps()
  end

  @doc false
  def changeset(user_type, attrs) do
    user_type
    |> cast(attrs, [:type, :actions])
    |> validate_required([:type, :actions])
    |> unique_constraint(:type)
  end
end
