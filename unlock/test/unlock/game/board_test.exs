defmodule Unlock.Game.BoardTest do
  use ExUnit.Case

  alias Unlock.Game.Board

  describe "new/0" do
    test "should return board struct with empty list of guesses and code" do
      board = Board.new()
      assert board.guesses == []
      assert length(board.code) == 4
      assert board.__struct__ == Board
    end
  end
end
