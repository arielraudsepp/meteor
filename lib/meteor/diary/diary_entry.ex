defmodule Meteor.Diary.DiaryEntry do
  use Ecto.Schema
  import Ecto.Changeset

  schema "diary_entries" do
    field :anger, :integer
    field :drug_use, :integer
    field :entry_date, :date
    field :fear, :integer
    field :joy, :integer
    field :pain, :integer
    field :sadness, :integer
    field :self_harm, :integer
    field :shame, :integer
    field :suicide, :integer
    field :user_id, :integer

    timestamps()
  end

  @doc false
  def changeset(diary_entry, attrs) do
    diary_entry
    |> cast(attrs, [:user_id, :pain, :sadness, :joy, :shame, :anger, :fear, :drug_use, :suicide, :self_harm, :entry_date])
    |> validate_required([:user_id, :pain, :sadness, :joy, :shame, :anger, :fear, :drug_use, :suicide, :self_harm, :entry_date])
  end
end
