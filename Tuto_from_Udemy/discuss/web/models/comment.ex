defmodule Discuss.Comment do
    use Discuss.Web, :model

    @derive {Poison.Encoder, only: [:content, :user]} # to tell poison to care only about field content when fetching data into JSON

    schema "comments" do
        field :content, :string
        belongs_to :user, Discuss.User
        belongs_to :topic, Discuss.Topic

        timestamps()
    end

    def changeset(struc, params \\ %{}) do
        struc
        |> cast(params, [:content])
        |> validate_required([:content])
    end    
end