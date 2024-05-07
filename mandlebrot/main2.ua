# Experimental!
# Mandlebrot

~ "../lib/Graphics.ua" ~ NormalComplexField NormalRange
Ncf ← NormalComplexField
Nr ← NormalRange

ImageArgs ← °{⊙⊙⊙⊙∘}≡get{"Resolution" "Zoom" "Position" "Complex" "Iteration"}¤
Image ← /+>2⌵⊙◌⍥(⊂+×.⊢,,)⊃⋅⋅∘⊙∘[∘]+×Ncf ImageArgs
ColorLerp ← ⊏:⊂↯:0⊢⇌△.≡⍜-×¤⊙¤ ⊙⊙(⊂0÷⟜⍜¯⇡-1/↥♭.)
RandomColors ← ColorLerp ⚂_⚂_⚂ ⚂_⚂_⚂

StateMap ← map {"Resolution" "Zoom" "Position" "Complex" "Iteration" "ZoomFactor" "ComplexFactor"} {20 1 (ℂ0 0) (ℂ0.4 0.4) 20 0.2 0.5}
ReadInput ← (
  ⍣(
    ⍜(get"Position")+:×ℂ1 0 ×∩(°□get)"ZoomFactor", "Zoom".°"w"
  | ⍜(get"Position")+:×ℂ¯1 0×∩(°□get)"ZoomFactor","Zoom".°"s"
  | ⍜(get"Position")+:×ℂ0 1×∩(°□get)"ZoomFactor","Zoom".°"a"
  | ⍜(get"Position")+:×ℂ0 ¯1×∩(°□get)"ZoomFactor","Zoom".°"d"
  | ⍜(get"Complex")+:×ℂ1 0×∩(°□get)"ComplexFactor","Zoom".°"W"
  | ⍜(get"Complex")+:×ℂ¯1 0×∩(°□get)"ComplexFactor","Zoom".°"S"
  | ⍜(get"Complex")+:×ℂ0 1×∩(°□get)"ComplexFactor","Zoom".°"A"
  | ⍜(get"Complex")+:×ℂ0 ¯1×∩(°□get)"ComplexFactor","Zoom".°"D"
  | ⍜(get"Iterations"|+1) °"z"
  | ⍜(get"Iterations"|-1) °"x"
  | ⍜(get"ComplexFactor"|×2) °"h"
  | ⍜(get"ComplexFactor"|×0.5) °"g"
  | ⍜(get"Zoom"|×1.11111111) °"m"
  | ⍜(get"Zoom"|×0.9) °"n"
  | ⍜(get"ZoomFactor"|×1.11111111) °"M"
  | ⍜(get"ZoomFactor"|×0.9) °"N"
  | ⍜(get"Resolution"|×1.11111111) °"t"
  | ⍜(get"Resolution"|×0.9) °"y"
  | ∘◌
  )
  &ims RandomColors Image.
  &p.
)

Continue ← ¬≍"q"
Main ← (
  &raw 1
  ⍢(&rs 1 0 ReadInput)(Continue) " " StateMap
  &raw 0
  ◌◌
  &p"Goodbye!"
)

Main
