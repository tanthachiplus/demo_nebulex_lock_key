runing node 
  iex --name node1@127.0.0.1 -S mix
  iex --name node2@127.0.0.1 -S mix

call function: 
  DemoNebulexLockKey.get_cache(1, 5000) in node 1

  DemoNebulexLockKey.get_cache(1, 10000) in node 2