MESSAGE_SEPERATOR := "~|~"

BlockMessage := Object clone
BlockMessage create := method(messageType, blockItem,
  messageType ... MESSAGE_SEPERATOR ... blockItem
)

