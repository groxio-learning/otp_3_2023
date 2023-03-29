defmodule Tally.Service do
  alias Tally.Counter

  # ---------- CLIENT --------------
  def start(input) do
    # spawn ...
    spawn(fn ->
      input
      |> Counter.new()
      |> loop
    end)
  end

  def increment(pid) do
    send(pid, :inc)
  end

  def decrement(pid) do
    send(pid, :dec)
  end

  def show(pid) do
    send(pid, {:show, self})

    receive do
      m ->
        m
    end
  end

  # ---------- SERVER --------------
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
