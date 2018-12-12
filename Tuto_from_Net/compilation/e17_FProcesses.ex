# The Spawn Function
# accepts a function that will be run in the new process. For example −
pid = spawn(fn -> 2 * 2 end)
Process.alive?(pid)

pid = self 
Process.alive?(pid)



# send messages to a process with send and receive them with receive. 
# Let us pass a message to the current process and receive it on the same.
send(self(), {:hello, "Hi people"})
receive do
   {:hello, msg} -> IO.puts(msg)
   {:another_case, msg} -> IO.puts("This one won't match!")
end