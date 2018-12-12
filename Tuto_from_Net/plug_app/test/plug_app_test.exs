defmodule PlugAppTest do
  use ExUnit.Case
  doctest PlugApp

  test "greets the world" do
    assert PlugApp.hello() == :world
  end
end
