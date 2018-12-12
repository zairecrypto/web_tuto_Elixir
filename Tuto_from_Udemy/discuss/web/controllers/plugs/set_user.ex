defmodule Discuss.Plug.SetUser do
    import Plug.Conn
    import Phoenix.Controller

    alias Discuss.Repo
    alias Discuss.User
    alias Discuss.Router.Helpers

    def init(_returnVal) do
        
    end

    def call(conn, _returnVal) do
        user_id = get_session(conn, :user_id)
        
        cond do
             ->
                
        end
    end
end