defmodule MeteorWeb.Router do
  use MeteorWeb, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/api", MeteorWeb do
    pipe_through :api
    resources "/skills", SkillController, except: [:new, :edit]
    resources "/diary_entries", DiaryEntryController, except: [:new, :edit]
    get "/diary_entry/:entry_date", DiaryEntryController, :show_by_entry_date
    post "/diary_entry_skills", DiaryEntrySkillController, :create
  end

  # Enable LiveDashboard and Swoosh mailbox preview in development
  if Application.compile_env(:meteor, :dev_routes) do
    # If you want to use the LiveDashboard in production, you should put
    # it behind authentication and allow only admins to access it.
    # If your application does not have an admins-only section yet,
    # you can use Plug.BasicAuth to set up some basic authentication
    # as long as you are also using SSL (which you should anyway).
    import Phoenix.LiveDashboard.Router

    scope "/dev" do
      pipe_through [:fetch_session, :protect_from_forgery]

      live_dashboard "/dashboard", metrics: MeteorWeb.Telemetry
      forward "/mailbox", Plug.Swoosh.MailboxPreview
    end
  end
end
