map = %{:a => 1, 2 => :b}
# IO.puts(map[:a])
# IO.puts(map[2])

# new_map = Dict.put_new(map, :new_val, "value") 
# IO.puts(new_map[:new_val])

# When a map is used in a pattern, it will always match on a subset of the given value −
# %{:a => a} = %{:a => 1, 2 => :b}
# map2 = %{} 
# map2 = map
# IO.puts(map2[:a])

# Variables can be used when accessing, matching and adding map keys −
# n = 1
# map = %{n => :one}
# %{^n => :one} = %{1 => :one, 2 => :two, 3 => :three}

# When all the keys in a map are atoms, you can use the keyword syntax for convenience −
map = %{:a => 1, 2 => :b, a: 7} 
IO.puts(map.a) 