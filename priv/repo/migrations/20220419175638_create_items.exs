defmodule LiveTest.Repo.Migrations.CreateItems do
  use Ecto.Migration

  def change do
    create table(:items) do
      add :text, :string
      add :complete, :boolean, default: false, null: false

      timestamps()
    end
  end
end
