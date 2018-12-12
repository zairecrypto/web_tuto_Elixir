defmodule Loop do
    # base case funciton
   def print_multiple_times(msg, n) when n <= 1 do
      IO.puts "Last print: " <> msg
   end

   def print_multiple_times(msg, n \\ 5) do
      IO.puts msg
      print_multiple_times(msg, n - 1)
   end
end