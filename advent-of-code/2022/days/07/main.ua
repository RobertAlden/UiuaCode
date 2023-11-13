&fras "test.txt"
⊜□≠@\n.

# substr str -> bool
StartsWith ← (≍⊃∘(↙⧻))
# substr str -> bool
EndsWith ← (StartsWith∩⇌)
# substr arr -> arr
RemoveMatches ← (▽¬⊐∺≍⊙.)
# str -> bool
IsFile ← (±⧻⊐regex "\\d+")
# str -> number
FileToSize ← (⊐(parse⊢regex) "\\d+")

RemoveMatches "$ ls"
RemoveMatches "$ cd .."
≡(⊐StartsWith "$ cd").
↘1⊕□\+
