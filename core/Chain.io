Chain := Object clone do (
  blockchain := list(Genesis create)
  debug := blockchain println
  getLatest := blockchain at(blockchain size - 1)
  addBlock := method(newBlock, 
    if(ChainManager isValidNewBlock(newBlock, getLatest))
      then(blockchain append(newBlock))
  )
  generateNextBlock := method(blockdata,
    prev := getLatest()
    nextIndex := blockchain size + 1
    nextTime := 1465154709
    nextHash := ChainManager calculateHash(nextIndex, prev hash, nextTime, blockdata)
    BlockItem create(nextIndex, prev hash, nextTime, blockdata, nextHash)
  )
)
