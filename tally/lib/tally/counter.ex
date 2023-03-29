defmodule Tally.Counter do
  defstruct [:count]

  def new(x), do: %__MODULE__{count: String.to_integer(x)}

  def inc(%{count: count} = counter, x), do: %{counter | count: count + x}

  def show(%{count: count}), do: "The ans arrrr is #{count}"
end
