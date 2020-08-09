defmodule TestAuth.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  def start(_type, _args) do
    children = [
      # Start the Ecto repository
      TestAuth.Repo,
      # Start the Telemetry supervisor
      TestAuthWeb.Telemetry,
      # Start the PubSub system
      {Phoenix.PubSub, name: TestAuth.PubSub},
      # Start the Endpoint (http/https)
      TestAuthWeb.Endpoint
      # Start a worker by calling: TestAuth.Worker.start_link(arg)
      # {TestAuth.Worker, arg}
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: TestAuth.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  def config_change(changed, _new, removed) do
    TestAuthWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
