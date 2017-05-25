
// Block Object 
Block := Object clone
Block create := method(
    index, prevHash, timestamp, data, hash,
    blockItem := Block clone
    blockItem index := index
    blockItem prevHash := prevHash
    blockItem timestamp := timestamp
    blockItem data := data
    blockItem hash := hash
    blockItem
)


ChainManager := Object clone
ChainManager calulateHashForBlock := method(blockItem, 
   ChainManager calculateHash(blockItem index, blockItem prevHash, blockItem timestamp, blockItem data)
)
ChainManager calculateHash := method(index, previousHash, timestamp, data,
    digest := SHA1 clone
    digest appendSeq(index .. previousHash .. timestamp .. data)
    digest sha1String    
)
ChainManager isValidNewBlock := method(
    newBlock, previousBlock,
    if(previousBlock index + 1 != newBlock index) 
        then(
           "invalid index" println
           false
        ) 
    elseif(previousBlock hash != newBlock prevHash)
        then(
            "invalid prevHash" println
            false
        ) 
    elseif(ChainManager calulateHashForBlock(newBlock) != newBlock hash)
        then(
            "invalid hash" println
            false
        ) 
    else(true)
)
ChainManager clone := ChainManager


Genesis := Object clone
Genesis create := method(
    blockItem := Block create(
        0, "0", 1465154705, "The genesis block", "816534932c2b7154836da6afc367695e6337db8a921823784c14378abed4f7d7"
    )
)


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
    Block create(nextIndex, prev hash, nextTime, blockdata, nextHash)
)


chain := Chain clone
chain generateNextBlock("foobar") println
chain debug
