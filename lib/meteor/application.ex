defmodule Meteor.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      # Start the Telemetry supervisor
      MeteorWeb.Telemetry,
      # Start the Ecto repository
      Meteor.Repo,
      # Start the PubSub system
      {Phoenix.PubSub, name: Meteor.PubSub},
      # Start Finch
      {Finch, name: Meteor.Finch},
      # Start the Endpoint (http/https)
      MeteorWeb.Endpoint
      # Start a worker by calling: Meteor.Worker.start_link(arg)
      # {Meteor.Worker, arg}
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: Meteor.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  @impl true
  def config_change(changed, _new, removed) do
    MeteorWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
