defmodule Unlock.Game.Board do
  defstruct [:guesses, :code]

  alias Unlock.Game.Score

  def new() do
    %__MODULE__{
      guesses: [],
      code: generate_code()
    }
  end

  defp generate_code() do
    Enum.shuffle(1..8)
    |> Enum.take(4)
  end

  def guess(board, input) do
    %{board | guesses: [input | board.guesses]}
  end

  def show(board) do
    show_guesses =
      board.guesses
      |> Enum.map(&Score.compute(board.code, &1))

    %{guesses: show_guesses, status: calculate_status(board.guesses, board.code)}
  end

  def calculate_status(guesses, code) do
    cond do
      code == hd(guesses) -> :win
      length(guesses) == 10 -> :lose
      true -> :play
    end
  end
end
