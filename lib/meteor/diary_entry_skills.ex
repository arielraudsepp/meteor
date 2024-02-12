defmodule Meteor.DiaryEntrySkills do
  @moduledoc """
  The DiaryEntrySkills context.
  """

  import Ecto.Query, warn: false
  alias Meteor.Repo

  alias Meteor.DiaryEntrySkills.DiaryEntrySkill

  @doc """
  Returns the list of diary_entry_skills.

  ## Examples

      iex> list_diary_entry_skills()
      [%DiaryEntrySkill{}, ...]

  """
  def list_diary_entry_skills do
    Repo.all(DiaryEntrySkill)
  end

  @doc """
  Gets a single diary_entry_skill.

  Raises `Ecto.NoResultsError` if the Diary entry skill does not exist.

  ## Examples

      iex> get_diary_entry_skill!(123)
      %DiaryEntrySkill{}

      iex> get_diary_entry_skill!(456)
      ** (Ecto.NoResultsError)

  """
  def get_diary_entry_skill!(id), do: Repo.get!(DiaryEntrySkill, id)

  @doc """
  Creates a diary_entry_skill.

  ## Examples

      iex> create_diary_entry_skill(%{field: value})
      {:ok, %DiaryEntrySkill{}}

      iex> create_diary_entry_skill(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_diary_entry_skill(attrs \\ %{}) do
  %DiaryEntrySkill{}
  |> DiaryEntrySkill.changeset(attrs)
  |> Repo.insert(returning: [:diary_entry_id, :skill_id])
end

  @doc """
  Updates a diary_entry_skill.

  ## Examples

      iex> update_diary_entry_skill(diary_entry_skill, %{field: new_value})
      {:ok, %DiaryEntrySkill{}}

      iex> update_diary_entry_skill(diary_entry_skill, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_diary_entry_skill(%DiaryEntrySkill{} = diary_entry_skill, attrs) do
    diary_entry_skill
    |> DiaryEntrySkill.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a diary_entry_skill.

  ## Examples

      iex> delete_diary_entry_skill(diary_entry_skill)
      {:ok, %DiaryEntrySkill{}}

      iex> delete_diary_entry_skill(diary_entry_skill)
      {:error, %Ecto.Changeset{}}

  """
  def delete_diary_entry_skill(%DiaryEntrySkill{} = diary_entry_skill) do
    Repo.delete(diary_entry_skill)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking diary_entry_skill changes.

  ## Examples

      iex> change_diary_entry_skill(diary_entry_skill)
      %Ecto.Changeset{data: %DiaryEntrySkill{}}

  """
  def change_diary_entry_skill(%DiaryEntrySkill{} = diary_entry_skill, attrs \\ %{}) do
    DiaryEntrySkill.changeset(diary_entry_skill, attrs)
  end
end
