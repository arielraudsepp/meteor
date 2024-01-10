defmodule MeteorWeb.DiaryEntrySkillController do
  use MeteorWeb, :controller

  alias Meteor.DiaryEntry
  alias Meteor.DiaryEntry.DiaryEntrySkill

  action_fallback MeteorWeb.FallbackController

  def index(conn, _params) do
    diary_entry_skills = DiaryEntry.list_diary_entry_skills()
    render(conn, :index, diary_entry_skills: diary_entry_skills)
  end

  def create(conn, %{"diary_entry_skill" => diary_entry_skill_params}) do
    with {:ok, %DiaryEntrySkill{} = diary_entry_skill} <- DiaryEntry.create_diary_entry_skill(diary_entry_skill_params) do
      conn
      |> put_status(:created)
      |> put_resp_header("location", ~p"/api/diary_entry_skills/#{diary_entry_skill}")
      |> render(:show, diary_entry_skill: diary_entry_skill)
    end
  end

  def show(conn, %{"id" => id}) do
    diary_entry_skill = DiaryEntry.get_diary_entry_skill!(id)
    render(conn, :show, diary_entry_skill: diary_entry_skill)
  end

  def update(conn, %{"id" => id, "diary_entry_skill" => diary_entry_skill_params}) do
    diary_entry_skill = DiaryEntry.get_diary_entry_skill!(id)

    with {:ok, %DiaryEntrySkill{} = diary_entry_skill} <- DiaryEntry.update_diary_entry_skill(diary_entry_skill, diary_entry_skill_params) do
      render(conn, :show, diary_entry_skill: diary_entry_skill)
    end
  end

  def delete(conn, %{"id" => id}) do
    diary_entry_skill = DiaryEntry.get_diary_entry_skill!(id)

    with {:ok, %DiaryEntrySkill{}} <- DiaryEntry.delete_diary_entry_skill(diary_entry_skill) do
      send_resp(conn, :no_content, "")
    end
  end
end
