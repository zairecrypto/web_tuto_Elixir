defmodule Discuss.Repo.Migrations.AddTopics do
  use Ecto.Migration

  def change do
    create table(:topics) do    #create a table topics
      add :title, :string       #make sure it has column title and string
    end
  end
end
