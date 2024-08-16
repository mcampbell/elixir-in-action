defmodule MultiDict do
  @moduledoc """
  A multi-value dictionary.  Each key can have a list of values.
  """

  @doc """
  Create a new empty MultiDict.

  ## Examples

      iex> MultiDict.new()
      %{}
  """
  def new(), do: %{}

  @doc """
  Add an entry to the MultiDict.

  ## Examples

      iex> m = MultiDict.new()
      iex> m = MultiDict.add(m, :a, 1)
      iex> m = MultiDict.add(m, :a, 2)
      iex> m = MultiDict.add(m, :b, 3)
      iex> m
      %{a: [2, 1], b: [3]}
  """
  def add(multi_dict, key, value) do
    Map.update(multi_dict, key, [value], &[value | &1])
  end

  @doc """
  Get the values for a key in the MultiDict.  Returns an empty list if the key is not present.

  ## Examples

        iex> m = MultiDict.new()
        iex> m = MultiDict.add(m, :a, 1)
        iex> m = MultiDict.add(m, :a, 2)
        iex> m = MultiDict.add(m, :b, 3)
        iex> MultiDict.get(m, :a)
        [2, 1]
        iex> MultiDict.get(m, :b)
        [3]
        iex> MultiDict.get(m, :c)
        []
  """
  def get(multi_dict, key) do
    Map.get(multi_dict, key, [])
  end
end
