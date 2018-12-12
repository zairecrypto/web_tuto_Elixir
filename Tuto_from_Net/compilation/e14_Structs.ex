# To define a struct, the defstruct construct is used −
defmodule User do
   defstruct name: "John", age: 27
end


# to execute in IEX after running "elixirc e14_Structs.ex"
# user1 = %User{}
# user2 = %User{name: "Ayush", age: 20}
# user3 = %User{name: "Megan"}

# Accessing and Updating Structs
user4 = %User{}
#user4 right now is: %User{age: 27, name: "John"}

#To access name and age of John, 
IO.puts(john.name)
IO.puts(john.age)