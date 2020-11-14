defmodule Easysubs.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  def start(_type, _args) do
    children = [
      # Start the Ecto repository
      Easysubs.Repo,
      # Start the Telemetry supervisor
      EasysubsWeb.Telemetry,
      # Start the PubSub system
      {Phoenix.PubSub, name: Easysubs.PubSub},
      # Start the Endpoint (http/https)
      EasysubsWeb.Endpoint
      # Start a worker by calling: Easysubs.Worker.start_link(arg)
      # {Easysubs.Worker, arg}
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: Easysubs.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  def config_change(changed, _new, removed) do
    EasysubsWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
