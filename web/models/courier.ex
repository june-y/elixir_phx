defmodule Rxsystem.Courier do
  use Rxsystem.Web, :model

  schema "couriers" do
    field :name, :string
    field :address, :string
    field :pharmacies_serviced, {:array, :string}

    timestamps()
  end

  @doc """
  Builds a changeset based on the `struct` and `params`.
  """
  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:name, :address, :pharmacies_serviced])
    |> validate_required([:name, :address, :pharmacies_serviced])
  end
end
