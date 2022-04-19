defmodule LiveTest.TodoFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `LiveTest.Todo` context.
  """

  @doc """
  Generate a item.
  """
  def item_fixture(attrs \\ %{}) do
    {:ok, item} =
      attrs
      |> Enum.into(%{
        complete: true,
        text: "some text"
      })
      |> LiveTest.Todo.create_item()

    item
  end
end
