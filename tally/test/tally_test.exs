defmodule TallyTest do
  use ExUnit.Case
  doctest Tally

  test "greets the world" do
    assert Tally.hello() == :world
  end
end
