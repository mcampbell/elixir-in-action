defmodule TodoList do
  @moduledoc """
  TodoList management.

  A list of things to do, by date.  More than one thing can be done on the same day.
  """

  @doc """
  Create a new empty TodoList.

  ## Examples

      iex> TodoList.new()
      %{}
  """
  def new, do: MultiDict.new()

  @doc """
  Add a new item to the TodoList list.

  ## Examples

      iex> t = TodoList.new()
      iex> t = TodoList.add_entry(t, ~D[2016-01-01], "Buy milk")
      iex> t
      %{~D[2016-01-01] => ["Buy milk"]}

      iex> t = TodoList.new()
      iex> t = TodoList.add_entry(t, ~D[2016-01-01], "Buy milk")
      iex> t = TodoList.add_entry(t, ~D[2016-01-01], "Buy more milk")
      iex> t
      %{~D[2016-01-01] => ["Buy more milk", "Buy milk"]}
  """
  def add_entry(todo_list, date, title), do: MultiDict.add(todo_list, date, title)
end
