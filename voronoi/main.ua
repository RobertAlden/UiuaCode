Size ← × 2 192_192
Nearest ← ⊢⍏≡/+×.-¤
Points ← [⍥(⌊×Size⚂_⚂)]
Circle ← ×[Size]⊂0.5_0.5+0.5×0.25⍉⊟°∠ +×⚂π××2π÷⊃∘⇡-1
Normalize ← ×÷:1/↥.-/↧.

Tone ← [0.95_0.25_0.21]
Colors ← ×Tone[⍥[⚂ ⚂ ⚂]]

Main ← (
  # ⊃(Points|Colors) 64
  ⊃(Circle|Colors) 24
  ↯⊂Size 3 ⊏≡Nearest⊙¤↯¯1_2⇡Size
  &p "Preview:"
  &ime "png" &ims.
  &fwa"out.png"
  &p "Done."
)

Main
