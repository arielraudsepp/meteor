defmodule MeteorWeb.DiaryEntrySkillController do
  use MeteorWeb, :controller

  alias Meteor.DiaryEntrySkills

  action_fallback MeteorWeb.FallbackController

  def create(conn, %{"diary_entry_skill" => diary_entry_skill_params}) do
    with {:ok, _diary_entry_skill} <- DiaryEntrySkills.create_diary_entry_skill(diary_entry_skill_params) do
      conn
      |> put_status(:created)
      |> send_resp(201, "Created")
    end
  end
end
