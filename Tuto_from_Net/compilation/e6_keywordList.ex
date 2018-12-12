# keyword list : list of tuples wtih the first item of the tuple is an atom.
# list1 = [{:a, 1}, {:b, 2}]
# list2 = [a: 1, b: 2]
# IO.puts(list1 == list2)
# IO.puts(list1[:a]) # to print the value of the keyword

# Accessing a key
kl = [a: 1, a: 2, b: 3] 
IO.puts(Keyword.get(kl, :a)) 
IO.puts(Keyword.get_values(kl, :a))

# Inserting a key
# kl = [a: 1, a: 2, b: 3]
# kl_new = Keyword.put_new(kl, :c, 5)
# IO.puts(Keyword.get(kl_new, :c))


# Deleting a key
# kl = [a: 1, a: 2, b: 3, c: 0]
# kl = Keyword.delete_first(kl, :b)
# kl = Keyword.delete(kl, :a)

# IO.puts(Keyword.get(kl, :a))
# IO.puts(Keyword.get(kl, :b))
# IO.puts(Keyword.get(kl, :c))

# kl = [a: 1, a: 2, b: 3] 
# IO.puts(Keyword.get(kl, :a)) 
# IO.puts(Keyword.get_values(kl)) 