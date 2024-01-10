defmodule MeteorWeb.DiaryEntrySkillControllerTest do
  use MeteorWeb.ConnCase

  import Meteor.DiaryEntryFixtures

  alias Meteor.DiaryEntry.DiaryEntrySkill

  @create_attrs %{
    diary_entry_id: 42,
    skill_id: 42
  }
  @update_attrs %{
    diary_entry_id: 43,
    skill_id: 43
  }
  @invalid_attrs %{diary_entry_id: nil, skill_id: nil}

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  describe "index" do
    test "lists all diary_entry_skills", %{conn: conn} do
      conn = get(conn, ~p"/api/diary_entry_skills")
      assert json_response(conn, 200)["data"] == []
    end
  end

  describe "create diary_entry_skill" do
    test "renders diary_entry_skill when data is valid", %{conn: conn} do
      conn = post(conn, ~p"/api/diary_entry_skills", diary_entry_skill: @create_attrs)
      assert %{"id" => id} = json_response(conn, 201)["data"]

      conn = get(conn, ~p"/api/diary_entry_skills/#{id}")

      assert %{
               "id" => ^id,
               "diary_entry_id" => 42,
               "skill_id" => 42
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, ~p"/api/diary_entry_skills", diary_entry_skill: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "update diary_entry_skill" do
    setup [:create_diary_entry_skill]

    test "renders diary_entry_skill when data is valid", %{conn: conn, diary_entry_skill: %DiaryEntrySkill{id: id} = diary_entry_skill} do
      conn = put(conn, ~p"/api/diary_entry_skills/#{diary_entry_skill}", diary_entry_skill: @update_attrs)
      assert %{"id" => ^id} = json_response(conn, 200)["data"]

      conn = get(conn, ~p"/api/diary_entry_skills/#{id}")

      assert %{
               "id" => ^id,
               "diary_entry_id" => 43,
               "skill_id" => 43
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn, diary_entry_skill: diary_entry_skill} do
      conn = put(conn, ~p"/api/diary_entry_skills/#{diary_entry_skill}", diary_entry_skill: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "delete diary_entry_skill" do
    setup [:create_diary_entry_skill]

    test "deletes chosen diary_entry_skill", %{conn: conn, diary_entry_skill: diary_entry_skill} do
      conn = delete(conn, ~p"/api/diary_entry_skills/#{diary_entry_skill}")
      assert response(conn, 204)

      assert_error_sent 404, fn ->
        get(conn, ~p"/api/diary_entry_skills/#{diary_entry_skill}")
      end
    end
  end

  defp create_diary_entry_skill(_) do
    diary_entry_skill = diary_entry_skill_fixture()
    %{diary_entry_skill: diary_entry_skill}
  end
end
