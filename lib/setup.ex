defmodule Setup do
  use GenServer

  def start_link(_arg) do
    GenServer.start_link(__MODULE__, %{}, [name: __MODULE__])
  end

  def init(_init_arg) do
    :ok = ReplicatedCache.put(1, %{id: 1, name: "account 1", balance: 0})
    :ok = ReplicatedCache.put(2, %{id: 2, name: "account 2", balance: 0})
    {:ok, %{}}
  end
end
