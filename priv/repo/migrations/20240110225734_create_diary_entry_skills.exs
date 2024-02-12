defmodule Meteor.Repo.Migrations.CreateDiaryEntrySkills do
  use Ecto.Migration

  def change do
    create table("diary_entry_skills") do
      add :diary_entry_id, references(:diary_entries)
      add :skill_id, references(:skills)

      timestamps()
    end
  end
end
