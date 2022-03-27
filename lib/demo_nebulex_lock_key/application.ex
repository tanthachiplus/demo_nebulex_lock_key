defmodule DemoNebulexLockKey.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    :ok = setup_cluster()

    children = [
      # Starts a worker by calling: DemoNebulexLockKey.Worker.start_link(arg)
      # {DemoNebulexLockKey.Worker, arg}
      ReplicatedCache,
      Setup
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: DemoNebulexLockKey.Supervisor]
    Supervisor.start_link(children, opts)
  end

  defp setup_cluster do
    :demo_nebulex_lock_key
    |> Application.get_env(:nodes, [])
    |> Enum.each(&:net_adm.ping/1)
  end
end
