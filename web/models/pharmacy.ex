defmodule Rxsystem.Pharmacy do
  use Rxsystem.Web, :model

  schema "pharmacies" do
    field :name, :string
    field :address, :string

    timestamps()
  end

  @doc """
  Builds a changeset based on the `struct` and `params`.
  """
  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:name, :address])
    |> validate_required([:name, :address])
  end
end
