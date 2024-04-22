# Experimental!

Vars ← map {"playerPos"} {3_3}

Symbols ← " @oO.△"
WorldSize ← 5_5
World ← ↯:⌊×⧻Symbols[⍥⚂]×°⊟. WorldSize

CreatePlayer ← ⍜⊡◌⊙⊙1

DisplayWorld ← ≡&p⊏:Symbols ⊙@\n

GameLoop ← (
  ◌ # consume user input
  &p @\n
  &p DisplayWorld.
  &p @\n
)

Continue ← ¬≍"q"
Main ← (
  World
  &raw 1
  ⍢(GameLoop)(Continue. &rs 1 0)
  &raw 0
)

Main
