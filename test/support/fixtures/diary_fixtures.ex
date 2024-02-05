defmodule Meteor.DiaryFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `Meteor.Diary` context.
  """

  @doc """
  Generate a diary_entry.
  """
  def diary_entry_fixture(attrs \\ %{}) do
    {:ok, diary_entry} =
      attrs
      |> Enum.into(%{
        anger: 42,
        drug_use: 42,
        entry_date: ~D[2024-01-03],
        fear: 42,
        joy: 42,
        notes: nil,
        pain: 42,
        sadness: 42,
        self_harm: 42,
        shame: 42,
        skills: [],
        suicide: 42,
        user_id: 42
      })
      |> Meteor.Diary.create_diary_entry()

    diary_entry
  end
end
