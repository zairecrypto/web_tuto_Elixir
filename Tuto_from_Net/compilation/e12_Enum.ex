res = Enum.all?([1, 2, 3, 4], &(rem(&1,2) == 1))
# &(rem(&1,2) == 1) is equivalent to fn(s) -> rem(s,2) == 1 end

Enum.each(["Hello", "Every", "one"], &(IO.puts(&1)))
# Enum.each(["Hello", "Every", "one"], fn(s) -> IO.puts(s) end)

Enum.reduce(["1", "2", "3", "4"],"x", &(&1 <> &2))
Enum.reduce(1..100,0, &(&1+&2))

odd? = &(rem(&1, 2) != 0) 
res = 1..100_000 |> Enum.map(&(&1 * 3)) |> Enum.filter(odd?) |> Enum.sum 
IO.puts(res) 