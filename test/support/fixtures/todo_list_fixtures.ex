defmodule LiveTest.TodoListFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `LiveTest.TodoList` context.
  """

  @doc """
  Generate a todo.
  """
  def todo_fixture(attrs \\ %{}) do
    {:ok, todo} =
      attrs
      |> Enum.into(%{
        complete: true,
        name: "some name"
      })
      |> LiveTest.TodoList.create_todo()

    todo
  end
end
