defmodule Meteor.SkillsFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `Meteor.Skills` context.
  """

  @doc """
  Generate a skill.
  """
  def skill_fixture(attrs \\ %{}) do
    {:ok, skill} =
      attrs
      |> Enum.into(%{
        category: "some category",
        description: "some description",
        name: "some name"
      })
      |> Meteor.Skills.create_skill()

    skill
  end
end
