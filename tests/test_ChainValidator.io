Foo := Object clone
Foo bar := method(
    "bar"
)

Test := Object clone
Test run := block(
  return(Foo bar)
)
Test run println

Foo bar := method(
    "spam"
  )
