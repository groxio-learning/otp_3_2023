defmodule Tally.Service do
  alias Tally.Counter

  def start(input) do
    # spawn ...
    spawn(fn ->
      input
      |> Counter.new()
      |> loop
    end)
  end

  def loop(count) do
    count
    |> listen()
    |> loop()
  end

  def listen(count) do
    receive do
      :inc ->
        Counter.inc(count, 1)

      :dec ->
        Counter.inc(count, -1)

      {:show, from_pid} ->
        send(from_pid, Counter.show(count))
        count
    end
  end
end
