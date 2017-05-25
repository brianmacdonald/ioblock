// BlockItem Object 
BlockItem := Object clone
BlockItem create := method(
    index, prevHash, timestamp, data, hash,
    blockItem := BlockItem clone
    blockItem index := index
    blockItem prevHash := prevHash
    blockItem timestamp := timestamp
    blockItem data := data
    blockItem hash := hash
    blockItem
)
