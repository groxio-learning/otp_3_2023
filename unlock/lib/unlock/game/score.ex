defmodule Unlock.Game.Score do
  defstruct [:ans, :guess, :reds, :whites]

  @total 4

  def new(ans, guess) do
    %__MODULE__{ans: ans, guess: guess, reds: 0, whites: 0}
    |> compute_reds()
    |> compute_whites()
  end

  def compute(ans, guess) do
    new(ans, guess) |> show()
  end

  def show(score) do
    rs = String.duplicate("r", score.reds)
    ws = String.duplicate("w", score.whites)
    guess = Enum.map(score.guess, &Integer.to_string/1)

    "#{guess} #{rs}#{ws}"
  end

  defp compute_reds(score) do
    %{
      score
      | reds:
          Enum.zip(score.ans, score.guess)
          |> Enum.count(fn {a, g} -> a == g end)
    }
  end

  defp compute_whites(score) do
    missing = Enum.count(score.guess -- score.ans)
    %{score | whites: @total - (score.reds + missing)}
  end
end
