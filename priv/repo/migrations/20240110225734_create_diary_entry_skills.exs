defmodule Meteor.Repo.Migrations.CreateDiaryEntrySkills do
  use Ecto.Migration

  def change do
    create table(:diary_entry_skills) do
      add :diary_entry_id, :integer
      add :skill_id, :integer

      timestamps()
    end
  end
end
