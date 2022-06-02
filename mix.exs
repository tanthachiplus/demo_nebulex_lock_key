defmodule DemoNebulexLockKey.MixProject do
  use Mix.Project

  def project do
    [
      app: :demo_nebulex_lock_key,
      version: "0.1.0",
      elixir: "~> 1.13",
      start_permanent: Mix.env() == :prod,
      deps: deps()
    ]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      extra_applications: [:logger],
      mod: {DemoNebulexLockKey.Application, []}
    ]
  end

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      {:nebulex, "~> 2.3"},
      # => When using :shards as backend
      {:shards, "~> 1.0"},
      # => When using Caching Annotations
      {:decorator, "~> 1.4"},
      # => When using the Telemetry events (Nebulex stats)
      {:telemetry, "~> 1.0"},
      {:jchash, "0.1.2"}
      # {:dep_from_hexpm, "~> 0.3.0"},
      # {:dep_from_git, git: "https://github.com/elixir-lang/my_dep.git", tag: "0.1.0"}
    ]
  end
end
