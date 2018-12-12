a = "ö, ł"
IO.puts a

# You can create an empty string using the string literal, "". For example,
a = ""
if String.length(a) === 0 do
   IO.puts("a is an empty string")
end


# String Interpolation : way to construct a new String value from a mix of 
# constants, variables, literals, and expressions by including their values 
# inside a string literal

x = "Apocalypse" 
y = "X-men #{x}"
IO.puts(y)

# String Concatenation
x = "Dark"
y = "Knight"
z = x <> " " <> y
IO.puts(z)

# String Length
IO.puts(String.length("Hello"))

# Reversing a String
IO.puts(String.reverse("Elixir"))

# String Comparison
var_1 = "Hello world"
var_2 = "Hello world "
if var_1 === var_2 do
   IO.puts("#{var_1} and #{var_2} are the same")
else
   IO.puts("#{var_1} and #{var_2} are not the same")
end

# String Matching
# To check if a string matches a regex, we can also use the string 
# match operator or the String.match? function. 
myEmail = "teddmabulay7yyy7 tresor"
IO.puts(String.match?(myEmail, ~r/^[a-zA-Z0-9]$/)) 
IO.puts(String.match?("bar", ~r/foo/))
IO.puts(String.match?("fooooooooooooooooooooo" =~ ~r/foo/))


#string functions
IO.puts String.at(myEmail, 4)
IO.puts String.capitalize(myEmail)
IO.puts String.concontains?(myEmail, "tresor")
# etc


# Binary
IO.puts(<< 256 >>) # truncated, it'll print << 0 >>
IO.puts(<< 256 :: size(16) >>) #Takes 16 bits/2 bytes, will print << 1, 0 >>
IO.puts(<< 256 :: utf8 >>) #We can also use the utf8 modifier, if a character is code point then, it will be produced in the output;

myTestBinary = << 256 :: utf8 >>
IO.puts is_binary(myTestBinary)


# Bitstrings
# If we define a binary using the size modifier and pass it a value that is not a multiple
# of 8, we end up with a bitstring instead of a binary
bs = << 1 :: size(1) >>
IO.puts(bs)
IO.puts(is_binary(bs))
IO.puts(is_bitstring(bs))