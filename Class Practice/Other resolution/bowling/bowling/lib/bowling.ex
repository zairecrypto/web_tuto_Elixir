defmodule Bowling do
  def score(game) do
    game_list = List.flatten(game)
    |> Enum.map(fn x when is_nil(x) -> 0; x -> x end) # &+/2

    _score(game_list ++ [:end])
  end

  #end case
  defp _score([10,a2,b1,:end]), do: 10 + a2 + b1

  #two strike
  defp _score([10,_,10,b2,c1 | tail]), do: 20 + c1 + _score([10,b2,c1|tail])

  #strike
  defp _score([10,_,b1,b2 | tail]), do: 10 + b1 + b2 + _score([b1,b2|tail])

  #spare
  defp _score([a1,a2,b1 | tail]) when a1 + a2 == 10, do: 10 + b1 + _score([b1|tail])

  #normal
  defp _score([a1,:end]), do: a1
  defp _score([a1,a2 | tail]), do: a1 + a2 + _score(tail)
end
