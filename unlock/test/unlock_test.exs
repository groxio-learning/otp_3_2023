defmodule UnlockTest do
  use ExUnit.Case
  doctest Unlock

  test "greets the world" do
    assert Unlock.hello() == :world
  end
end
