defmodule Discuss.Topic do
    use Discuss.Web, :model

    schema "topics" do          # hey phx, look inside the postgres db, search
        field :title, :string   # for a table name "topics", we expect that table
                                # to have a single column called title and every value 
                                # inside it must be a string
        belongs_to :user, Discuss.User
        has_many :comments, Discuss.Comment
    end

    @doc """   

        iex> struct = %Discuss.Topic{}
        %Discuss.Topic{
            __meta__: #Ecto.Schema.Metadata<:built, "topics">,
            id: nil,
            title: nil
        }
        iex> params = %{title: "Great JS"}
        iex> Discuss.Topic.changeset(struct, params)
        #Ecto.Changeset<
            action: nil,
            changes: %{title: "Great JS"},
            errors: [],
            data: #Discuss.Topic<>,
            valid?: true
        >
        iex> Discuss.Topic.changeset(struct, %{})
        #Ecto.Changeset<
            action: nil,
            changes: %{},
            errors: [title: {"can't be blank", [validation: :required]}],
            data: #Discuss.Topic<>,
            valid?: false
        >
        
    """
    def changeset(struct, params \\ %{}) do
        struct
        |> cast(params, [:title])
        |> validate_required([:title])
    end
end