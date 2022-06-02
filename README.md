runing node 
  iex --name node1@127.0.0.1 -S mix
  iex --name node2@127.0.0.1 -S mix

call function: 

  ReplicatedCache.all([{{:_, :"$1", %{:id => :"$2"}, :_, :_}, [{:==, 1, 1}],[{:element, 2, :"$_"}]}])
