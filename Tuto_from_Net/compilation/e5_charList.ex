#CharLists
IO.puts('Hello')
IO.puts(is_list('hello'))
# you can convert string into char list and vice versa
IO.puts(is_list(to_char_list("hełło")))
IO.puts(is_binary(to_string ('hełło')))

# (Linked) Lists : heterogeneous list of elements that are stored at different 
# locations in memory and are kept track of by using references
myLinkedList = [1, 2, true, 3]

# When Elixir sees a list of printable ASCII numbers, Elixir will print that as a char list 
# Whenever you see a value in IEx and you are not sure what it is, you can use the 
# i function to retrieve information about it
IO.puts([104, 101, 108, 108, 111])
IO.puts("t"<>to_string([178, 166, 87]))

# lenght of a list
IO.puts(length([1, 2, :true, "str"]))

# Concatenation and Subtraction
IO.puts([1, 2, 3] ++ [4, 5, 6])
IO.puts([1, true, 2, false, 3, true] -- [true, false]) # is not working I dont know why


# Tuples
myTuple = {:ok, "hello"}
myTuple2 = Tuple.append(myTuple, "test")
tuple_size({:ok, "hello"})
tuple_size(myTuple2)

tuple = {:bar, :baz}
new_tuple_1 = Tuple.insert_at(tuple, 0, :foo)
new_tuple_2 = put_elem(tuple, 1, :foobar)


# Tuples vs. Lists
# Lists are stored in memory as linked lists -> each element in a list holds its value 
#   and points to the following element until the end of the list is reached (each pair of 
#   value and pointer a cons cell) . -> accessing the length of a list is a linear operation: 
#   we need to traverse the whole list to get the size. 
#   => Updating a list is fast as long as we are prepending elements.

# Tuples are stored contiguously in memory. -> getting the tuple size or accessing an element
#   by index is fast. 
#   => updating or adding elements to tuples is expensive because it requires copying the whole tuple in memory.