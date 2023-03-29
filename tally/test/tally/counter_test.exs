defmodule Tally.CounterTest do
  use ExUnit.Case

  alias Tally.Counter

  describe "new/1" do
    test "should return an integer equivalent to the string value" do
      assert 42 == Counter.new("42")
    end
  end

  ### finish tests when you can, no deadline

end
