#IO.put "Hello world! I'm learning Elixir :-)" -> is not working, need to ask the lecturer why?
IO.puts("Hello world! I'm learning Elixir :-)");IO.puts("Second IO.put on the same line, you just need to put a ;\n")
IO.puts :myAtom_var #this is an atom, a variable that the name name is equal to it value

_some_random_value = 42 #this is a variable that is meant NOT to be used
IO.puts _some_random_value

reserved_var = "after     and     catch     do     inbits     inlist     nil     else     end 
not     or     false     fn     in     rescue     true     when     xor 
__MODULE__    __FILE__    __DIR__    __ENV__    __CALLER__ "

IO.puts reserved_var

#IO.puts <<65, 255, 289::size(15)>>

IO.puts 10 && 60

x = 12
x = "Hello"
IO.puts(x)