defmodule LiveTest.TodoListTest do
  use LiveTest.DataCase

  alias LiveTest.TodoList

  describe "todos" do
    alias LiveTest.TodoList.Todo

    import LiveTest.TodoListFixtures

    @invalid_attrs %{complete: nil, name: nil}

    test "list_todos/0 returns all todos" do
      todo = todo_fixture()
      assert TodoList.list_todos() == [todo]
    end

    test "get_todo!/1 returns the todo with given id" do
      todo = todo_fixture()
      assert TodoList.get_todo!(todo.id) == todo
    end

    test "create_todo/1 with valid data creates a todo" do
      valid_attrs = %{complete: true, name: "some name"}

      assert {:ok, %Todo{} = todo} = TodoList.create_todo(valid_attrs)
      assert todo.complete == true
      assert todo.name == "some name"
    end

    test "create_todo/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = TodoList.create_todo(@invalid_attrs)
    end

    test "update_todo/2 with valid data updates the todo" do
      todo = todo_fixture()
      update_attrs = %{complete: false, name: "some updated name"}

      assert {:ok, %Todo{} = todo} = TodoList.update_todo(todo, update_attrs)
      assert todo.complete == false
      assert todo.name == "some updated name"
    end

    test "update_todo/2 with invalid data returns error changeset" do
      todo = todo_fixture()
      assert {:error, %Ecto.Changeset{}} = TodoList.update_todo(todo, @invalid_attrs)
      assert todo == TodoList.get_todo!(todo.id)
    end

    test "delete_todo/1 deletes the todo" do
      todo = todo_fixture()
      assert {:ok, %Todo{}} = TodoList.delete_todo(todo)
      assert_raise Ecto.NoResultsError, fn -> TodoList.get_todo!(todo.id) end
    end

    test "change_todo/1 returns a todo changeset" do
      todo = todo_fixture()
      assert %Ecto.Changeset{} = TodoList.change_todo(todo)
    end
  end
end
