defmodule Discuss.Plugs.SetUser do
    import Plug.Conn
    import Phoenix.Controller

    alias Discuss.Repo
    alias Discuss.User

    def init(_returnVal) do
        
    end

    def call(conn, _returnVal) do
        user_id = get_session(conn, :user_id)
        
        cond do
            user = user_id && Repo.get(User, user_id) ->
                assign(conn, :user, user) #assign is a function of conn to assign a new connection
            true -> 
                assign(conn, :user, nil)
        end
    end
end