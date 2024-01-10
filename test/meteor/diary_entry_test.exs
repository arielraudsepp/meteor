defmodule Meteor.DiaryEntryTest do
  use Meteor.DataCase

  alias Meteor.DiaryEntry

  describe "diary_entry_skills" do
    alias Meteor.DiaryEntry.DiaryEntrySkill

    import Meteor.DiaryEntryFixtures

    @invalid_attrs %{diary_entry_id: nil, skill_id: nil}

    test "list_diary_entry_skills/0 returns all diary_entry_skills" do
      diary_entry_skill = diary_entry_skill_fixture()
      assert DiaryEntry.list_diary_entry_skills() == [diary_entry_skill]
    end

    test "get_diary_entry_skill!/1 returns the diary_entry_skill with given id" do
      diary_entry_skill = diary_entry_skill_fixture()
      assert DiaryEntry.get_diary_entry_skill!(diary_entry_skill.id) == diary_entry_skill
    end

    test "create_diary_entry_skill/1 with valid data creates a diary_entry_skill" do
      valid_attrs = %{diary_entry_id: 42, skill_id: 42}

      assert {:ok, %DiaryEntrySkill{} = diary_entry_skill} = DiaryEntry.create_diary_entry_skill(valid_attrs)
      assert diary_entry_skill.diary_entry_id == 42
      assert diary_entry_skill.skill_id == 42
    end

    test "create_diary_entry_skill/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = DiaryEntry.create_diary_entry_skill(@invalid_attrs)
    end

    test "update_diary_entry_skill/2 with valid data updates the diary_entry_skill" do
      diary_entry_skill = diary_entry_skill_fixture()
      update_attrs = %{diary_entry_id: 43, skill_id: 43}

      assert {:ok, %DiaryEntrySkill{} = diary_entry_skill} = DiaryEntry.update_diary_entry_skill(diary_entry_skill, update_attrs)
      assert diary_entry_skill.diary_entry_id == 43
      assert diary_entry_skill.skill_id == 43
    end

    test "update_diary_entry_skill/2 with invalid data returns error changeset" do
      diary_entry_skill = diary_entry_skill_fixture()
      assert {:error, %Ecto.Changeset{}} = DiaryEntry.update_diary_entry_skill(diary_entry_skill, @invalid_attrs)
      assert diary_entry_skill == DiaryEntry.get_diary_entry_skill!(diary_entry_skill.id)
    end

    test "delete_diary_entry_skill/1 deletes the diary_entry_skill" do
      diary_entry_skill = diary_entry_skill_fixture()
      assert {:ok, %DiaryEntrySkill{}} = DiaryEntry.delete_diary_entry_skill(diary_entry_skill)
      assert_raise Ecto.NoResultsError, fn -> DiaryEntry.get_diary_entry_skill!(diary_entry_skill.id) end
    end

    test "change_diary_entry_skill/1 returns a diary_entry_skill changeset" do
      diary_entry_skill = diary_entry_skill_fixture()
      assert %Ecto.Changeset{} = DiaryEntry.change_diary_entry_skill(diary_entry_skill)
    end
  end
end
