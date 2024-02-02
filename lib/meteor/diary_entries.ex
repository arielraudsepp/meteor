defmodule Meteor.DiaryEntries do
  @moduledoc """
  The DiaryEntries context.
  """

  import Ecto.Query, warn: false
  alias Meteor.Repo

  alias Meteor.DiaryEntries.DiaryEntry

  @doc """
  Returns the list of diary_entries.

  ## Examples

      iex> list_()
      [%DiaryEntry{}, ...]

  """
  def list_diary_entries do
    Repo.all(DiaryEntry)
  end

end
