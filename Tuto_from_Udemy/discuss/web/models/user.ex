defmodule Discuss.User do
    use Discuss.Web, :model

    schema "users" do
        field :email, :string
        field :provider, :string
        field :token, :string

        timestamps()
    end

    def changeset(struc, params \\ %{}) do
        struc
        |> cast(params, [:email, :provider, :token])
        |> validate_required([:email, :provider, :token])
    end
end