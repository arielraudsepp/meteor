defmodule MeteorWeb.DiaryEntryController do
  use MeteorWeb, :controller

  alias Meteor.Diary
  alias Meteor.Diary.DiaryEntry

  action_fallback MeteorWeb.FallbackController

  def index(conn, _params) do
    diary_entries = Diary.list_diary_entries()
    render(conn, :index, diary_entries: diary_entries)
  end

  def create(conn, %{"diary_entry" => diary_entry_params}) do
    with {:ok, %DiaryEntry{} = diary_entry} <- Diary.create_diary_entry(diary_entry_params) do
      conn
      |> put_status(:created)
      |> put_resp_header("location", ~p"/api/diary_entries/#{diary_entry}")
      |> render(:show, diary_entry: diary_entry)
    end
  end

  def show(conn, %{"id" => id}) do
    diary_entry = Diary.get_diary_entry!(id)
    render(conn, :show, diary_entry: diary_entry)
  end

  def show_by_entry_date(conn, %{"entry_date" => entry_date}) do
    diary_entry = Diary.get_diary_entry_by_date!(entry_date)
    render(conn, :show, diary_entry: diary_entry)
  end

  def update(conn, %{"id" => id, "diary_entry" => diary_entry_params}) do
    diary_entry = Diary.get_diary_entry!(id)

    with {:ok, %DiaryEntry{} = diary_entry} <- Diary.update_diary_entry(diary_entry, diary_entry_params) do
      render(conn, :show, diary_entry: diary_entry)
    end
  end

  def delete(conn, %{"id" => id}) do
    diary_entry = Diary.get_diary_entry!(id)

    with {:ok, %DiaryEntry{}} <- Diary.delete_diary_entry(diary_entry) do
      send_resp(conn, :no_content, "")
    end
  end
end
