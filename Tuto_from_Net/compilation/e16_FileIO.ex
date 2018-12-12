# part1: paths
# IO.puts(Path.join("foo", "bar"))

# part2: File
# {:ok, file} = File.read("newfile", [:write]) 
# # Pattern matching to store returned stream
# IO.binwrite(file, "This will be written to the file")

# to open a file
# {:ok, file} = File.open("testfile")
# file = File.open!("testfile")

# file = File.open!("testfile", [:read, :utf8])

# File.write("testfile", "Hello")



# #Open the file in read, write and utf8 modes. 
# file = File.open!("testfile", [:read, :utf8, :write])

# #Write to this "io_device" using standard IO functions
# IO.puts(file, "Random text")


# read from a file
# IO.puts(File.read("testfile"))
IO.puts(File.read!("e1_hello_world.ex"))

# Whenever you open a file using the File.open function, after you are 
# done using it, you should close it using the File.close function −

# File.close(file)