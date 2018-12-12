defmodule Chat.Supervisor do
    use Supervisor
    def start_link do
        Supervisor.strat_link(__MODULE__, [])
    end


    # to allow to create proceseses to watch our proceseses
    # for this Supervisor, we shall create a a process that will try to restart 
    # our server process in case it dies

    # to init the process
    def init(_) do
        children = [
            worker(Chat.Server, [])
        ]

        supervise(children, strategy: :one_for_one)
            # one_for_one : if 1 process dies, the supervisor will try to spin it up, 
            # # if one process dies, it will not affect the other ones
            # one_for_all : if 1 process dies, -> restart all the processes that is over looking
            # rest_for_one : if 1 process dies, it will that process and all processes that was activated after it 
    end

end