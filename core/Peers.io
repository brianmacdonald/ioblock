
Peer := Object clone
Peer create := method(host, port,
    peer := Peer clone
    peer host := host
    peer port := port
    peer
)
