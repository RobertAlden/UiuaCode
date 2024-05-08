# Experimental!
# Mandlebrot

~ "../lib/Graphics.ua" ~ NormalComplexField NormalRange
Ncf ← NormalComplexField
Nr ← NormalRange

ImageArgs ← °{⊙⊙⊙⊙∘}≡get{"Resolution" "Zoom" "Position" "Complex" "Iterations"}¤
Image ← /+>2⌵⊙◌⍥(⊂+×.⊢,,)⊃⋅⋅∘⊙∘[∘]+×Ncf ImageArgs
ColorLerp ← ⊏:⊂↯:0⊢⇌△.≡⍜-×¤⊙¤ ⊙⊙(Nr/↥♭.)
RandomColors ← ColorLerp ×0.5 ⚂_⚂_⚂ ⍜-× 1 ⚂_⚂_⚂ 0.5

InitStateMap ← (map {"Resolution" "Zoom" "Position" "Complex" "Iterations" "ZoomFactor" "ComplexFactor"} {16 1 (ℂ0 0) (/ℂ-0.5⚂_⚂) 15 0.2 0.0005})
ReadInput ← (
  ⍣(
    ⍜(get"Position")+:×ℂ¯1 0 ×∩(°□get)"ZoomFactor", "Zoom".°"w"
  | ⍜(get"Position")+:×ℂ1 0×∩(°□get)"ZoomFactor","Zoom".°"s"
  | ⍜(get"Position")+:×ℂ0 ¯1×∩(°□get)"ZoomFactor","Zoom".°"a"
  | ⍜(get"Position")+:×ℂ0 1×∩(°□get)"ZoomFactor","Zoom".°"d"
  | ⍜(get"Complex")+:×ℂ1 0×∩(°□get)"ComplexFactor","Zoom".°"W"
  | ⍜(get"Complex")+:×ℂ¯1 0×∩(°□get)"ComplexFactor","Zoom".°"S"
  | ⍜(get"Complex")+:×ℂ0 1×∩(°□get)"ComplexFactor","Zoom".°"A"
  | ⍜(get"Complex")+:×ℂ0 ¯1×∩(°□get)"ComplexFactor","Zoom".°"D"
  | ⍜(get"Iterations"|↧125+1) °"F"
  | ⍜(get"Iterations"|↥5-1) °"R"
  | ⍜(get"ComplexFactor"|↧0.5×2) °"Q"
  | ⍜(get"ComplexFactor"|↥1e¯5×0.5) °"E"
  | ⍜(get"Zoom"|↧2 ×1.11111111) °"r"
  | ⍜(get"Zoom"|↥1e¯5×0.9) °"f"
  | ⍜(get"ZoomFactor"|×1.11111111) °"M"
  | ⍜(get"ZoomFactor"|×0.9) °"N"
  | ⍜(get"Resolution"|↧2048×2) °"q"
  | ⍜(get"Resolution"|↥8×0.5) °"e"
  | InitStateMap ◌ °"Z"
  | ∘◌
  )
  RandomColors Image. &p.
  # &ims
  &fwa "out.jpg" &ime "jpg"
)

Continue ← ¬≍"X"
Main ← (
  &raw 1
  ⍢(&rs 1 0 ReadInput)(Continue) " " InitStateMap
  &raw 0
  ◌◌
  &p"Goodbye!"
)

⍣(Main|&raw0)
