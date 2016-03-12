defmodule OfficeElixir.Repo.Migrations.CreateLight do
  use Ecto.Migration

  def change do
    create table(:lights) do
      add :state, :boolean, default: false
      add :address, :integer
      add :index, :integer
      add :description, :string
      add :zone, :string

      timestamps
    end

  end
end
