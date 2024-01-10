defmodule Meteor.DiaryEntryFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `Meteor.DiaryEntry` context.
  """

  @doc """
  Generate a diary_entry_skill.
  """
  def diary_entry_skill_fixture(attrs \\ %{}) do
    {:ok, diary_entry_skill} =
      attrs
      |> Enum.into(%{
        diary_entry_id: 42,
        skill_id: 42
      })
      |> Meteor.DiaryEntry.create_diary_entry_skill()

    diary_entry_skill
  end
end
