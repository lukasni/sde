defmodule SDETest do
  use ExUnit.Case
  doctest SDE

  test "greets the world" do
    assert SDE.hello() == :world
  end
end
