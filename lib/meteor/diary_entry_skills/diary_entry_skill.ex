defmodule Meteor.DiaryEntrySkills.DiaryEntrySkill do
  use Ecto.Schema
  import Ecto.Changeset

  schema "diary_entry_skills" do
    belongs_to :diary_entry, Meteor.DiaryEntries.DiaryEntry
    belongs_to :skill, Meteor.Skills.Skill
    timestamps()
  end

  @doc false
  def changeset(diary_entry_skill, attrs) do
    diary_entry_skill
    |> cast(attrs, [:diary_entry_id, :skill_id])
  end
end
