defmodule SauceElixirTest do
  use ExUnit.Case
  doctest SauceElixir

  test "greets the world" do
    assert SauceElixir.hello() == :world
  end
end
