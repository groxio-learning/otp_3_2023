defmodule Unlock.Game.Board do
  defstruct [:guesses, :code, :scores]

  alias Unlock.Game.Score

  def new() do
    %__MODULE__{
      guesses: [],
      scores: [],
      code: generate_code()
    }
  end

  defp generate_code() do
    Enum.shuffle(1..8)
    |> Enum.take(4)
  end

  def guess(board, input) do
    score = Score.compute(board.code, input)
    %{board | guesses: [input | board.guesses], scores: [score | board.scores]}
  end

  def show(board) do
    %{guesses: board.scores, status: calculate_status(board.guesses, board.code)}
  end

  def calculate_status(guesses, code) do
    cond do
      code == hd(guesses) -> :win
      length(guesses) == 10 -> :lose
      true -> :play
    end
  end
end
