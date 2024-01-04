defmodule Meteor.Repo.Migrations.CreateDiaryEntries do
  use Ecto.Migration

  def change do
    create table(:diary_entries) do
      add :user_id, :integer
      add :pain, :integer
      add :sadness, :integer
      add :joy, :integer
      add :shame, :integer
      add :anger, :integer
      add :fear, :integer
      add :drug_use, :integer
      add :suicide, :integer
      add :self_harm, :integer
      add :entry_date, :date

      timestamps()
    end
  end
end
