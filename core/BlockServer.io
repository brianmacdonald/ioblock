
BlockServer := Server clone setPort(8456)
BlockServer peers := list clone
BlockServer run := method(
  BlockServer start
)
BlockServer handleSocket := method(aSocket,
  Echo clone @handleSocketFromServer(aSocket, self)
)
BlockServer handleSocketFromServer := method(aSocket, aServer,
  write("[Got echo connection from ", aSocket host, "]\n")
  while(aSocket isOpen,
   if(aSocket read, aSocket write(aSocket readBuffer asString))
   aSocket readBuffer empty
  )
  write("[Closed ", aSocket host, "]\n")
)

