defmodule Tally.Counter do


  def new(x), do: String.to_integer(x)

  def inc(acc, x), do: acc + x

  def show(acc), do: "The ans arrrr is #{acc}"
end
