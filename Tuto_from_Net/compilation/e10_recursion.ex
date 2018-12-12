defmodule Math do
   def fact(res, num) do
    if num === 1 do
        res
    else
        new_res = res * num
        fact(new_res, num-1)
      end
   end

   def facto(x) do
       if x === 0 or x < 0 do 1
       else 
            x*facto(x-1)
       end 
   end
end

defmodule ListPrint do
   def print([]) do
   end
   def print([head | tail]) do 
      IO.puts(head)
      print(tail)
   end
end