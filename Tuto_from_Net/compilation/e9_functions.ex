# defmodule Operations do
#     def oneUnkown(a,b,c) do
#         # a.x + b = c
#         (c - b)/a
#     end
#     def sumOf(a,b) do
#         # a.x + b = c
#         a + b
#     end
# end

sum1 = fn (a, b) -> a + b end
# IO.puts(sum1.(1, 5)) # This type of fucntions are called using "."


# Using the Capture Operator
# parameters are not named but are available to us as &1, &2, &3, and so on.
sum2 = &(&1 + &2) 
# IO.puts(sum2.(3,4))

f = &(&1+5)
x = 1..10 |> Enum.map(f)

handle_result = fn
   {var1} -> IO.puts("#{var1} found in a tuple!")
   {var_2, var_3} -> IO.puts("#{var_2} and #{var_3} found!")
   {} -> IO.puts("nothing found!")
end
# handle_result.({"Hey people"})
# handle_result.({"Hello", "World"})
# handle_result.({})

defmodule Greeter do
   def hello(name), do: phrase <> name
   defp phrase, do: "Hello "
end

# IO.puts(Greeter.hello("world"))

# If we want a default value for an argument, we use the argument \\ value syntax −
defmodule Greeter2 do
   def hello(name, country \\ "en") do
      phrase(country) <> name
   end

   defp phrase("en"), do: "Hello, "
   defp phrase("es"), do: "Hola, "
   defp phrase("fr"), do: "Bonjour, "
end