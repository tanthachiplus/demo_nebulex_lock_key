import Config

config :demo_nebulex_lock_key, ReplicatedCache,
  gc_interval: :timer.hours(12),
  max_size: 1_000_000,
  name: ReplicatedCache,
  allocated_memory: 2_000_000_000,
  gc_cleanup_min_timeout: :timer.seconds(10),
  gc_cleanup_max_timeout: :timer.minutes(10),
  backend: :ets,
  partitions: System.schedulers_online() * 2,
  stats: true,
  nodes: [:"node1@127.0.0.1", :"node2@127.0.0.1"]

config :demo_nebulex_lock_key,
  nodes: [:"node1@127.0.0.1", :"node2@127.0.0.1"]
