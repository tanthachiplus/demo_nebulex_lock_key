defmodule DemoNebulexLockKey do
  @moduledoc """
  Documentation for `DemoNebulexLockKey`.
  """


  def get_cache(key \\ 1) do
    ReplicatedCache.transaction([keys: [key], nodes: [:"node1@127.0.0.1", :"node2@127.0.0.1"]], fn ->
      ReplicatedCache.in_transaction?() |> IO.inspect()

      # get account
      account = ReplicatedCache.get(key)

      # put new balance
      ReplicatedCache.put(key, %{account | balance: account.balance + 100})

      # sleep 5s
      Process.sleep(5000)

      # re-get ReplicatedCache
      account = ReplicatedCache.get(key)

      # inspect account
      account |> IO.inspect(label: "account after deposit 100")

      # deposit 200
      ReplicatedCache.put(key, %{account | balance: account.balance + 200})

      # sleep 5s
      Process.sleep(5000)

       # re-get ReplicatedCache
       account = ReplicatedCache.get(key)

       # inspect account
      account |> IO.inspect(label: "account after add 200")
    end)
  end
end
