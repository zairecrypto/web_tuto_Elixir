defmodule Chat.Server do
    use GenServer 


# CLIENT SIDE {
    

    # to create a simple GenServer module
    def start_link do
        # you can replace __MODULE__ by Chat.Server
        # [] is the initial state
        GenServer.start_link(__MODULE__, [], name: :chat_room) 
    end

    # to get the msgs from our process
    def get_msgs do
        GenServer.call(:chat_room, :get_msgs)
    end

    # allows us to modify the initial []
    def add_msg(msg) do
        GenServer.cast(:chat_room, {:add_msg, msg})
    end

# }

# SERVER SIDE / CALLBACK FUNCTIONS {

    # function to respond to start_link
    def init(msgs) do
        {:ok, msgs}
    end

    def handle_call(:get_msgs, _from, msgs) do
        {:reply, msgs, msgs}
    end

    def handle_cast({:add_msg, msg}, msgs) do
        {:noreply, [msg | msgs]}
    end
end
# }


# TO excute in IEX
# {:ok, pid} = Chat.Server.start_link
# Chat.Server.get_msgs pid to get the status
# set a msg Chat.Server.add_msg(pid, "hello")