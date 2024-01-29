defmodule Meteor.Repo.Migrations.AddNotes do
  use Ecto.Migration

  def change do
    alter table(:diary_entries) do
      add :notes, :text
    end
  end
end
