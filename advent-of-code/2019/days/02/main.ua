↘¯2&fras "input.txt"
⊜parse≠@,.
# What Where Arr | Arr
Write ← (⍜⊏;⊃(⋅⊙∘)∘)
OpI ← (+4⊙(Write⊙:⊃(/+⟜(⊏⊙.))(⋅∘)⊃↙(⊢↘)2↘1↙4↻).⊙.)
OpII ← (+4⊙(Write⊙:⊃(/×⟜(⊏⊙.))(⋅∘)⊃↙(⊢↘)2↘1↙4↻).⊙.)
Read ← ((∘|0)=99.⊏,,)
Iter ← ((∘|OpI|OpII)Read)
IsHalted ← (×∩≍⊙:Iter,,)
Run ← (⍢(Iter)(¬IsHalted))
Set ← (⍜⊡;⊙:)
Initialize ← (;⍢(⊃(↘1)(Set⍘⊟⊢))(>0⧻))
Silver ← (
  ⊙.
  ⍉⊟1_2
  Initialize
  Run 0
  ⊢;
)
Gold ← (+×100:⍘⊟♭▽=19690720⊙;≡Silver ⊙:./⊂⊠⊂.⇡100 ¤)
⊃(Gold|⊙;Silver 12_2)
