Input ← ⊐⊜∘≠@\n.&fras

S ← "+!@#$%^/&*-="
D ← +@0⇡10
Pad ← ⍥(⇌⍉≡⊂0)4
Adjacent ← ≡≡(/↥/↥)◫3_3 Pad
M ← (⍜(⊡1_3);:1↯:0 3_7)

Silver ← /+⊜parse∩♭×⍥(⊙(Adjacent×).)2⊃(∊:D|Adjacent ∊:S). Input

LR ← /↥≡≡⬚0↻[1 0 ¯1]¤
GearRegions ← ▽⊓(♭|☇¯2) ≡≡(=@*⊡1_3). ◫3_7
ExtractDigits ← ≡(□⊜parse∩♭)⊙;≡(⍥(× LR ⊙.)2 ×Adjacent ⊙.)

Gold ← (
  ?GearRegions Input
  ≡×¤Adjacent M .∊:D.
  ⊙;⍥(×≡LR ⊙.)5
  ▽=2∵⧻.⊐≡(/⊂≡(⊜parse))
  /+≡(/×⊔)
)

⊃(Gold|Silver) "input.txt"
