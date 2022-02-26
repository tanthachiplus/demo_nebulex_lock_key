defmodule ReplicatedCache do
  use Nebulex.Cache,
    otp_app: :demo_nebulex_lock_key,
    adapter: Nebulex.Adapters.Replicated,
    primary_storage_adapter: Nebulex.Adapters.Local
    # adapter: Nebulex.Adapters.Local

end
