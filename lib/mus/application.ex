defmodule Mus.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      {Plug.Cowboy, scheme: :http, plug: Mus.Router, options: [port: 8000]}, # HTTP Server
      Mus.Repo # DB Connection
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: Mus.Supervisor]
    Supervisor.start_link(children, opts)
  end
end
