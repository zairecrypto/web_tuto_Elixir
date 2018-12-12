IO.puts("with map")
1..3
|> Enum.map(&IO.inspect(&1))
|> Enum.map(&(&1 * 2))
|> Enum.map(&IO.inspect(&1))

IO.puts("with Streams")
stream = 1..3
|> Stream.map(&IO.inspect(&1))
|> Stream.map(&(&1 * 2))
|> Stream.map(&IO.inspect(&1))
Enum.to_list(stream)