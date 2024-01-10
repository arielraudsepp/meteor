defmodule MeteorWeb.DiaryEntrySkillJSON do
  alias Meteor.DiaryEntry.DiaryEntrySkill

  @doc """
  Renders a list of diary_entry_skills.
  """
  def index(%{diary_entry_skills: diary_entry_skills}) do
    %{data: for(diary_entry_skill <- diary_entry_skills, do: data(diary_entry_skill))}
  end

  @doc """
  Renders a single diary_entry_skill.
  """
  def show(%{diary_entry_skill: diary_entry_skill}) do
    %{data: data(diary_entry_skill)}
  end

  defp data(%DiaryEntrySkill{} = diary_entry_skill) do
    %{
      id: diary_entry_skill.id,
      diary_entry_id: diary_entry_skill.diary_entry_id,
      skill_id: diary_entry_skill.skill_id
    }
  end
end
