defmodule Unlock do
  @moduledoc """
  Documentation for `Unlock`.
  """

  @doc """
  Hello world.

  ## Examples

      iex> Unlock.hello()
      :world

  """
  def hello do
    :world
  end

  def new_game(name) do
    DynamicSupervisor.start_child(:dsup, {Unlock.Game, name})
  end

  def move(name, guess) do
    Unlock.Game.guess(name, guess)
  end
end
