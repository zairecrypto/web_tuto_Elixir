defmodule Discuss.TopicController do
    use Discuss.Web, :controller
    alias Discuss.Topic

    # calling a guard class to indicate where the plug RequireAuth must be executed
    plug Discuss.Plugs.RequireAuth when action in [:new, :create, :edit, :update, :delete]
    plug :check_topic_owner when action in [:update, :edit, :delete]


    # let's create a function plug to manage the 
    def check_topic_owner(conn, _params) do
        %{params: %{"id" => topic_id}} = conn
        if Repo.get(Topic, topic_id).user_id == conn.assigns.user.id do
            conn
        else
            conn
            |> put_flash(:info, "No Access Right to this topic")
            |> redirect(to: topic_path(conn, :index))
            |> halt()
        end
    end

    def new(conn, _params) do
        
        changeset = Topic.changeset(%Topic{}, %{})
        render conn, "new.html", changeset: changeset
    end

    def create(conn, %{"topic" => topic}) do
        # %Topic{} because we are creating a changeset from scratch,
        # changeset represent a change that we wont to make to our db

        # conn.assigns[:user] is equivalent to conn.assigns.user



        changeset = Topic.changeset(%Topic{}, topic) 

        changeset = conn.assigns.user
            |> build_assoc(:topics)
            |> Topic.changeset(topic)

        case Repo.insert(changeset) do
            {:ok, _topics}         -> 
                # topics = Repo.all(Topic)
                # render conn, "index.html", topics: topics, changeset: changeset
                conn
                |> put_flash(:info, "Topic Created")
                |> redirect(to: topic_path(conn, :index))
            {:error, changeset} -> 
                render conn, "new.html", changeset: changeset
        end

    end

    def index(conn, _params) do
        topics = Repo.all(Topic)
        render conn, "index.html", topics: topics
    end

    def edit(conn, %{"id" => topic_id}) do
        topic = Repo.get(Topic, topic_id)
        IO.inspect topic
        changeset = Topic.changeset(topic)

        render conn, "edit.html", changeset: changeset, topic: topic
    end

    def update(conn, %{"id" => topic_id, "topic" => topic}) do
        old_topic = Repo.get(Topic, topic_id)
        changeset = Topic.changeset(old_topic, topic)
        # changeset = Repo.get(Topic, topic_id) |> Topic.changeset(topic)

        case Repo.update(changeset) do
            {:ok, _topic} ->
                conn
                |> put_flash(:info, "Topic Updated")
                |> redirect(to: topic_path(conn, :index))
            {:error, changeset} ->
                render conn, "edit.html", changeset: changeset, topic: old_topic
        end
    end

    def delete(conn, %{"id" => topic_id}) do
        Repo.get!(Topic, topic_id) |> Repo.delete!
        conn
        |> put_flash(:info, "Topic Deleted")
        |> redirect(to: topic_path(conn, :index))
    end

    def show(conn, %{"id" => topic_id}) do
        topic = Repo.get!(Topic, topic_id)
        render conn, "show.html", topic: topic
    end
end