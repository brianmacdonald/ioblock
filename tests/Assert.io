Assert := Object clone
Assert raise := Exception raise
Assert assert := method(check, msg
  if(check != true)
    then(raise msg)
)

