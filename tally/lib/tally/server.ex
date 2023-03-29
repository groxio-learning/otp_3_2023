defmodule Tally.Server do
  use GenServer
  alias Tally.Counter

  @me :counter

  def start_link(input) do
    GenServer.start_link(Tally.Server, input, name: @me)
  end

  def increment(pid \\ @me) do
    GenServer.cast(pid, :inc)
  end

  def decrement(pid \\ @me) do
    GenServer.cast(pid, :dec)
  end

  def show(pid \\ @me) do
    GenServer.call(pid, :show)
  end

  ## server

  def init(input) do
    {:ok, Counter.new(input)}
  end

  def handle_cast(:inc, count) do
    {:noreply, Counter.inc(count, 1)}
  end

  def handle_cast(:dec, count) do
    {:noreply, Counter.inc(count, -1)}
  end

  def handle_call(:show, _from, count) do
    {:reply, Counter.show(count), count}
  end
end
