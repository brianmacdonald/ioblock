ChainManager := Object clone
ChainManager calulateHashForBlock := method(blockItem, 
   ChainManager calculateHash(blockItem index, blockItem prevHash, blockItem timestamp, blockItem data)
)
ChainManager calculateHash := method(index, previousHash, timestamp, data,
    // This should be replaced with SHA256
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
