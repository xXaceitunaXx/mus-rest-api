defmodule MusTest do
  use ExUnit.Case
  doctest Mus

  test "greets the world" do
    assert Mus.hello() == :world
  end
end
