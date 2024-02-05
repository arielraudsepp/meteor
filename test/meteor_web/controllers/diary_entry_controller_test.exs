defmodule MeteorWeb.DiaryEntryControllerTest do
  use MeteorWeb.ConnCase

  import Meteor.DiaryFixtures

  alias Meteor.Diary.DiaryEntry

  @create_attrs %{
    anger: 42,
    drug_use: 42,
    entry_date: ~D[2024-01-03],
    fear: 42,
    joy: 42,
    notes: nil,
    pain: 42,
    sadness: 42,
    self_harm: 42,
    skills: [
      %{
        category: "distress_tolerance",
        description: "Stop, take a step back, observe, proceed mindfully",
        name: "STOP"
      }
    ],
    shame: 42,
    suicide: 42,
    user_id: 42
  }
  @update_attrs %{
    anger: 43,
    drug_use: 43,
    entry_date: ~D[2024-01-04],
    fear: 43,
    joy: 43,
    notes: "samples",
    pain: 43,
    sadness: 43,
    self_harm: 43,
    skills: [],
    shame: 43,
    suicide: 43,
    user_id: 43
  }
  @invalid_attrs %{anger: nil, drug_use: nil, entry_date: nil, fear: nil, joy: nil, pain: nil, sadness: nil, self_harm: nil, shame: nil, suicide: nil, user_id: nil}

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  describe "index" do
    test "lists all diary_entries", %{conn: conn} do
      conn = get(conn, ~p"/api/diary_entries")
      assert json_response(conn, 200)["data"] == []
    end
  end

  describe "create diary_entry" do
    test "renders diary_entry when data is valid", %{conn: conn} do
      conn = post(conn, ~p"/api/diary_entries", diary_entry: @create_attrs)
      assert %{"id" => id} = json_response(conn, 201)["data"]

      conn = get(conn, ~p"/api/diary_entries/#{id}")

      assert %{
               "id" => ^id,
               "anger" => 42,
               "drug_use" => 42,
               "entry_date" => "2024-01-03",
               "fear" => 42,
               "joy" => 42,
               "notes" => nil,
               "pain" => 42,
               "sadness" => 42,
               "self_harm" => 42,
               "skills" => [
                 %{
                   "category" => "distress_tolerance",
                   "description" => "Stop, take a step back, observe, proceed mindfully",
                   "name" => "STOP"
                 }
               ],
               "shame" => 42,
               "suicide" => 42,
               "user_id" => 42
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, ~p"/api/diary_entries", diary_entry: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "update diary_entry" do
    setup [:create_diary_entry]

    test "renders diary_entry when data is valid", %{conn: conn, diary_entry: %DiaryEntry{id: id} = diary_entry} do
      conn = put(conn, ~p"/api/diary_entries/#{diary_entry}", diary_entry: @update_attrs)
      assert %{"id" => ^id} = json_response(conn, 200)["data"]

      conn = get(conn, ~p"/api/diary_entries/#{id}")

      assert %{
               "id" => ^id,
               "anger" => 43,
               "drug_use" => 43,
               "entry_date" => "2024-01-04",
               "fear" => 43,
               "joy" => 43,
               "notes" => "samples",
               "pain" => 43,
               "sadness" => 43,
               "self_harm" => 43,
               "shame" => 43,
               "suicide" => 43,
               "user_id" => 43
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn, diary_entry: diary_entry} do
      conn = put(conn, ~p"/api/diary_entries/#{diary_entry}", diary_entry: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "delete diary_entry" do
    setup [:create_diary_entry]

    test "deletes chosen diary_entry", %{conn: conn, diary_entry: diary_entry} do
      conn = delete(conn, ~p"/api/diary_entries/#{diary_entry}")
      assert response(conn, 204)

      assert_error_sent 404, fn ->
        get(conn, ~p"/api/diary_entries/#{diary_entry}")
      end
    end
  end

  defp create_diary_entry(_) do
    diary_entry = diary_entry_fixture()
    %{diary_entry: diary_entry}
  end
end
