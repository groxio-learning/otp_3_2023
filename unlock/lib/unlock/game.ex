defmodule Unlock.Game do
  use GenServer

  alias Unlock.Game.Board

  def start_link(name) do
    GenServer.start_link(Unlock.Game, :unused, name: name)
  end

  def guess(game, input) do
    with true <- Kernel.is_binary(input),
         true <- valid_string?(input) do
      guess = convert_input(input)
      GenServer.call(game, {:guess, guess}) |> print()
    else
      _ -> raise "Invalid input."
    end
  end

  def print(board_map) do
    board_map.guesses
    |> Enum.join("\n")
    |> IO.puts()
  end

  def init(_) do
    {:ok, Board.new()}
  end

  def handle_call({:guess, guess}, _, board) do
    new_board = Board.guess(board, guess)
    {:reply, Board.show(new_board), new_board}
  end

  defp valid_string?(input) do
    String.match?(input, ~r/^[1-8]{4}$/)
  end

  defp convert_input(input) do
    input
    |> String.graphemes()
    |> Enum.map(&String.to_integer/1)
  end
end
