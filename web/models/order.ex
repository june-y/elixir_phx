defmodule Rxsystem.Order do
  use Rxsystem.Web, :model

  schema "orders" do
    field :order_number, :integer
    field :patient_name, :string
    field :patient_address, :string
    field :pickup_date, :date
    field :pickup_time, :time

    timestamps()
  end

  @doc """
  Builds a changeset based on the `struct` and `params`.
  """
  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:order_number, :patient_name, :patient_address, :pickup_date, :pickup_time])
    |> validate_required([:order_number, :patient_name, :patient_address, :pickup_date, :pickup_time])
  end
end
