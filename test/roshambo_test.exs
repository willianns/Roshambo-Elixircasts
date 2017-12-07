defmodule RoshamboTest do
  use ExUnit.Case
  doctest Roshambo

  test "no tests :(" do
    assert Roshambo.main(["pedra", "--pedra"]) == :ok
  end
end
