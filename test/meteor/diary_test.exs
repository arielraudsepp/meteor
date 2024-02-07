defmodule Meteor.DiaryEntriesTest do
  use Meteor.DataCase

  alias Meteor.DiaryEntries

  describe "diary_entries" do
    alias Meteor.DiaryEntries.DiaryEntry

    import Meteor.DiaryEntriesFixtures

    @invalid_attrs %{anger: nil, drug_use: nil, entry_date: nil, fear: nil, joy: nil, pain: nil, sadness: nil, self_harm: nil, shame: nil, suicide: nil, user_id: nil}

    test "list_diary_entries/0 returns all diary_entries" do
      diary_entry = diary_entry_fixture()
      assert DiaryEntries.list_diary_entries() == [diary_entry]
    end

    test "get_diary_entry!/1 returns the diary_entry with given id" do
      diary_entry = diary_entry_fixture()
      assert DiaryEntries.get_diary_entry!(diary_entry.id) == diary_entry
    end

    test "create_diary_entry/1 with valid data creates a diary_entry" do
      valid_attrs = %{anger: 42, drug_use: 42, entry_date: ~D[2024-01-03], fear: 42, joy: 42, pain: 42, sadness: 42, self_harm: 42, shame: 42, suicide: 42, user_id: 42}

      assert {:ok, %DiaryEntry{} = diary_entry} = DiaryEntries.create_diary_entry(valid_attrs)
      assert diary_entry.anger == 42
      assert diary_entry.drug_use == 42
      assert diary_entry.entry_date == ~D[2024-01-03]
      assert diary_entry.fear == 42
      assert diary_entry.joy == 42
      assert diary_entry.pain == 42
      assert diary_entry.sadness == 42
      assert diary_entry.self_harm == 42
      assert diary_entry.shame == 42
      assert diary_entry.suicide == 42
      assert diary_entry.user_id == 42
    end

    test "create_diary_entry/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = DiaryEntries.create_diary_entry(@invalid_attrs)
    end

    test "update_diary_entry/2 with valid data updates the diary_entry" do
      diary_entry = diary_entry_fixture()
      update_attrs = %{anger: 43, drug_use: 43, entry_date: ~D[2024-01-04], fear: 43, joy: 43, pain: 43, sadness: 43, self_harm: 43, shame: 43, suicide: 43, user_id: 43}

      assert {:ok, %DiaryEntry{} = diary_entry} = DiaryEntries.update_diary_entry(diary_entry, update_attrs)
      assert diary_entry.anger == 43
      assert diary_entry.drug_use == 43
      assert diary_entry.entry_date == ~D[2024-01-04]
      assert diary_entry.fear == 43
      assert diary_entry.joy == 43
      assert diary_entry.pain == 43
      assert diary_entry.sadness == 43
      assert diary_entry.self_harm == 43
      assert diary_entry.shame == 43
      assert diary_entry.suicide == 43
      assert diary_entry.user_id == 43
    end

    test "update_diary_entry/2 with invalid data returns error changeset" do
      diary_entry = diary_entry_fixture()
      assert {:error, %Ecto.Changeset{}} = DiaryEntries.update_diary_entry(diary_entry, @invalid_attrs)
      assert diary_entry == DiaryEntries.get_diary_entry!(diary_entry.id)
    end

    test "delete_diary_entry/1 deletes the diary_entry" do
      diary_entry = diary_entry_fixture()
      assert {:ok, %DiaryEntry{}} = DiaryEntries.delete_diary_entry(diary_entry)
      assert_raise Ecto.NoResultsError, fn -> DiaryEntries.get_diary_entry!(diary_entry.id) end
    end

    test "change_diary_entry/1 returns a diary_entry changeset" do
      diary_entry = diary_entry_fixture()
      assert %Ecto.Changeset{} = DiaryEntries.change_diary_entry(diary_entry)
    end
  end
end
