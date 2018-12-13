defmodule Discuss.Plugs.RequireAuth do
    import Plug.Conn
    import Phoenix.Controller

    alias Discuss.Router.Helpers

    def init(_returnVal) do
        
    end

    def call(conn, _returnVal) do
        if conn.assigns[:user] do
            conn
        else
            conn
            |> put_flash(:error, "You must be logged in.")
            |> redirect(to: Helpers.topic_path(conn, :index))
            |> halt()
        end
    end
end