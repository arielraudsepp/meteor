defmodule MeteorWeb.DiaryEntryJSON do
  alias Meteor.Diary.DiaryEntry

  @doc """
  Renders a list of diary_entries.
  """
  def index(%{diary_entries: diary_entries}) do
    %{data: for(diary_entry <- diary_entries, do: data(diary_entry))}
  end

  @doc """
  Renders a single diary_entry.
  """
  def show(%{diary_entry: diary_entry}) do
    %{data: data(diary_entry)}
  end

  defp data(%DiaryEntry{} = diary_entry) do
    %{
      id: diary_entry.id,
      user_id: diary_entry.user_id,
      pain: diary_entry.pain,
      sadness: diary_entry.sadness,
      joy: diary_entry.joy,
      shame: diary_entry.shame,
      anger: diary_entry.anger,
      fear: diary_entry.fear,
      drug_use: diary_entry.drug_use,
      suicide: diary_entry.suicide,
      self_harm: diary_entry.self_harm,
      entry_date: diary_entry.entry_date,
      notes: diary_entry.notes
    }
  end
end
