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
  Add a new item to the TodoList list.  Accepts a map with a `date` and a `title` field.

  ## Examples

      iex> t = TodoList.new()
      iex> t = TodoList.add_entry(t, %{date: ~D[2016-01-01], title: "Buy milk"})
      iex> t
      %{~D[2016-01-01] => ["Buy milk"]}

      iex> t = TodoList.new()
      iex> t = TodoList.add_entry(t, %{date: ~D[2016-01-01], title: "Buy milk"})
      iex> t = TodoList.add_entry(t, %{date: ~D[2016-01-01], title: "Buy more milk"})
      iex> t
      %{~D[2016-01-01] => ["Buy more milk", "Buy milk"]}
  """
  def add_entry(todo_list, entry), do: MultiDict.add(todo_list, entry.date, entry.title)

  @doc """
  Get the entries for a given date.

  ## Examples

      iex> t = TodoList.new()
      iex> t = TodoList.add_entry(t, %{date: ~D[2016-01-01], title: "Buy milk"})
      iex> t = TodoList.add_entry(t, %{date: ~D[2016-01-01], title: "Buy more milk"})
      iex> TodoList.entries(t, ~D[2016-01-01])
      ["Buy more milk", "Buy milk"]
      iex> TodoList.entries(t, ~D[1999-01-01])
      []
  """
  def entries(todo_list, date), do: MultiDict.get(todo_list, date)
end
