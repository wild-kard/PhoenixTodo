defmodule LiveTest.Todo.Item do
  use Ecto.Schema
  import Ecto.Changeset

  schema "items" do
    field :complete, :boolean, default: false
    field :text, :string

    timestamps()
  end

  @doc false
  def changeset(item, attrs) do
    item
    |> cast(attrs, [:text, :complete])
    |> validate_required([:text, :complete])
  end
end
