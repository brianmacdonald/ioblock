
BlockClient := Object clone
BlockClient createSocket := method(host, port, 
  socket := Socket clone setHost(host) setPort(port) connect
  if(socket error) then( write(socket error, "\n"); exit)
  socket
)
BlockClient send := method(messageType, blockItem, host, port, 
   socket := Blockclient createSocket(host, port)
   socket write(messageType, blockItem)
)
BlockClient latestMsg := method(host, port,
   messageType := "response"
   blockItem := ChainManager getLatest
   BlockClient send(messageType, blockItem, host, port)
)
BlockClient broadcastLatest := method(peers, 
  foreach(peers, peer, block(
      BlockClient latestMsg(peer host, peer port)
  )) 
)
