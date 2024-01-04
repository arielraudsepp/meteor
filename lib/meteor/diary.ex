defmodule Meteor.Diary do
  @moduledoc """
  The Diary context.
  """

  import Ecto.Query, warn: false
  alias Meteor.Repo

  alias Meteor.Diary.DiaryEntry

  @doc """
  Returns the list of diary_entries.

  ## Examples

      iex> list_diary_entries()
      [%DiaryEntry{}, ...]

  """
  def list_diary_entries do
    Repo.all(DiaryEntry)
  end

  @doc """
  Gets a single diary_entry.

  Raises `Ecto.NoResultsError` if the Diary entry does not exist.

  ## Examples

      iex> get_diary_entry!(123)
      %DiaryEntry{}

      iex> get_diary_entry!(456)
      ** (Ecto.NoResultsError)

  """
  def get_diary_entry!(id), do: Repo.get!(DiaryEntry, id)

  @doc """
  Creates a diary_entry.

  ## Examples

      iex> create_diary_entry(%{field: value})
      {:ok, %DiaryEntry{}}

      iex> create_diary_entry(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_diary_entry(attrs \\ %{}) do
    %DiaryEntry{}
    |> DiaryEntry.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a diary_entry.

  ## Examples

      iex> update_diary_entry(diary_entry, %{field: new_value})
      {:ok, %DiaryEntry{}}

      iex> update_diary_entry(diary_entry, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_diary_entry(%DiaryEntry{} = diary_entry, attrs) do
    diary_entry
    |> DiaryEntry.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a diary_entry.

  ## Examples

      iex> delete_diary_entry(diary_entry)
      {:ok, %DiaryEntry{}}

      iex> delete_diary_entry(diary_entry)
      {:error, %Ecto.Changeset{}}

  """
  def delete_diary_entry(%DiaryEntry{} = diary_entry) do
    Repo.delete(diary_entry)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking diary_entry changes.

  ## Examples

      iex> change_diary_entry(diary_entry)
      %Ecto.Changeset{data: %DiaryEntry{}}

  """
  def change_diary_entry(%DiaryEntry{} = diary_entry, attrs \\ %{}) do
    DiaryEntry.changeset(diary_entry, attrs)
  end
end
