defmodule Meteor.DiaryEntry.DiaryEntrySkill do
  use Ecto.Schema
  import Ecto.Changeset

  schema "diary_entry_skills" do
    field :diary_entry_id, :integer
    field :skill_id, :integer

    timestamps()
  end

  @doc false
  def changeset(diary_entry_skill, attrs) do
    diary_entry_skill
    |> cast(attrs, [:diary_entry_id, :skill_id])
    |> validate_required([:diary_entry_id, :skill_id])
  end
end
