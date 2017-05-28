ChainValidator isValidNewBlock := method(newBlock, previousBlock,
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
    elseif(ChainCalculator hashForBlock(newBlock) != newBlock hash)
        then(
            "invalid hash" println
            false
        ) 
    else(true)
)
ChainValidator clone := ChainValidator
