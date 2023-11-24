Dirs ← ("UDRL")
ParseDirection ← (⊟⊢▽:⇡⧻.=Dirs ⊃⊢(parse↘1))
Input ← (⊐⊜(⊜ParseDirection≠@,.)≠@\n. &fras)
Points ← (±(∘|¯)⊙(≡⊂(:|∘):0)⊃(⊃(◿2|<2))(+1⋅⇡)⍘⊟)
Traverse ← (\+⊐(/⊂≡Points))
Intersects ← (⊐(▽∊,⍘⊟≡Traverse))

Silver ← (/↧≡/+⌵Intersects)
Gold ← (/↧/++1⌵⊟∩⊗⊙:.⊐(▽∊,,,⍘⊟≡Traverse))
Solution ← (
  Input "input.txt"
  ⊃(Gold|Silver)
)
Solution
