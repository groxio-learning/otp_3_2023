defmodule Unlock.Game do
  defp convert_input(input) do
    input
    |> String.graphemes()
    |> Enum.map(&String.to_integer/1)
  end
end
