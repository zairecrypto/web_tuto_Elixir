[_, [_, {a}]] = ["Random string", [:an_atom, {24}]]
IO.puts a

[{var_1}, _unused_var, var_2] = [{"First variable"}, 25, "Second variable" ]
IO.puts var_2
IO.puts var_1


#if you have a variable "a" having value 25 and you want to match it with another 
# variable "b" having value 25, then you need to enter −

a = 25
b = 25
^a = b 

# last line matches the current value of a, instead of assigning it, to the value of b. 
# If we have a non-matching set of left and right hand side, the match operator raises an error. 

IO.puts a