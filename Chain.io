Chain := Object clone
Chain blockchain := list(Genesis create)
Chain debug := Chain blockchain println
Chain getLatest := Chain blockchain at(Chain blockchain size - 1)
Chain addBlock := method(newBlock, 
    if(ChainManager isValidNewBlock(newBlock, getLatest))
        then(blockchain append(newBlock))
)
Chain generateNextBlock := method(blockdata,
    prev := Chain getLatest()
    nextIndex := Chain blockchain size + 1
    nextTime := 1465154709
    nextHash := ChainManager calculateHash(nextIndex, prev hash, nextTime, blockdata)
    BlockItem create(nextIndex, prev hash, nextTime, blockdata, nextHash)
)
