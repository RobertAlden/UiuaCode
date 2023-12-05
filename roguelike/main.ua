#
#
Symbols ← " @"
World ← (↯:⍥[⚂]×⍘⊟.)
CreatePlayer ← ⍜⊡;⊙⊙1

DisplayWorld ← ≡&p⊏:Symbols ⊙@\n

GameLoop ← (
  ; # consume user input
  &p @\n
  &p DisplayWorld.
  &p @\n
)

Continue ← ¬≍"q"
Main ← (
  World 10_10
  CreatePlayer 5_5
  &raw 1
  ⍢(GameLoop)(Continue. &rs 1 0)
  &raw 0
)

Main
