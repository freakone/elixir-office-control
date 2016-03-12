defmodule OfficeElixir.Light do
  use OfficeElixir.Web, :model

  schema "lights" do
    field :state, :boolean, default: false
    field :address, :integer
    field :index, :integer
    field :description, :string
    field :zone, :string

    timestamps
  end

  @required_fields ~w(state address index description zone)
  @optional_fields ~w()

  @doc """
  Creates a changeset based on the `model` and `params`.

  If no params are provided, an invalid changeset is returned
  with no validation performed.
  """
  def changeset(model, params \\ :empty) do
    model
    |> cast(params, @required_fields, @optional_fields)
  end
end
