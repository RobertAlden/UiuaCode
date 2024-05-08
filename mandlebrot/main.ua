# Experimental!
# Mandlebrot

~ "../lib/Graphics.ua" ~ NormalComplexField NormalRange
Ncf ← NormalComplexField
Nr ← NormalRange

# Unpacks state values from map and creates the julia set iteration values.
ImageArgs ← °{⊙⊙⊙⊙∘}≡get{"Resolution" "Zoom" "Position" "Complex" "Iterations"}¤
Image ← /+>2⌵⊙◌⍥(⊂+×.⊢,,)⊃⋅⋅∘⊙∘[∘]+×Ncf ImageArgs

# Interpolates between two colors
ColorLerp ← ≡⍜-×¤⊙¤ ⊙⊙(Nr/↥♭.)

# Produces gradient between two lighter and darker random colors
RandomColors ← ⊏:⊂↯:0⊢⇌△. ColorLerp ×0.5 ⚂_⚂_⚂ ⍜-× 1 ⚂_⚂_⚂ 0.5

InitStateMap ← (map {"Resolution" "Zoom" "Position" "Complex" "Iterations" "ZoomFactor" "ComplexFactor"} {16 1 (ℂ0 0) (/ℂ-0.5⚂_⚂) 15 0.2 0.032})
ReadInput ← (
  ⍣(
    ⍜(get"Position")+:×ℂ¯1 0 ×∩(°□get)"ZoomFactor", "Zoom".°"w" # Move up
  | ⍜(get"Position")+:×ℂ1 0×∩(°□get)"ZoomFactor","Zoom".°"s"    # Move down
  | ⍜(get"Position")+:×ℂ0 1×∩(°□get)"ZoomFactor","Zoom".°"a"    # Move Left
  | ⍜(get"Position")+:×ℂ0 ¯1×∩(°□get)"ZoomFactor","Zoom".°"d"   # Move right
  | ⍜(get"Complex")+:×ℂ1 0×∩(°□get)"ComplexFactor","Zoom".°"W"  # Move up in complex plane
  | ⍜(get"Complex")+:×ℂ¯1 0×∩(°□get)"ComplexFactor","Zoom".°"S" # Move down in complex plane
  | ⍜(get"Complex")+:×ℂ0 1×∩(°□get)"ComplexFactor","Zoom".°"A"  # Move left in complex plane
  | ⍜(get"Complex")+:×ℂ0 ¯1×∩(°□get)"ComplexFactor","Zoom".°"D" # Move right in complex plane
  | ⍜(get"Iterations"|↧125+1) °"F"                              # Increase iteration depth
  | ⍜(get"Iterations"|↥5-1) °"R"                                # Decrese iteration depth
  | ⍜(get"ComplexFactor"|↧0.5×2) °"Q"                           # Double complex plane movement speed
  | ⍜(get"ComplexFactor"|↥1e¯5×0.5) °"E"                        # Halve complex plane movement speed
  | ⍜(get"Zoom"|↧2 ×1.11111111) °"r"                            # Zoom out
  | ⍜(get"Zoom"|↥1e¯5×0.9) °"f"                                 # Zoom in
  | ⍜(get"ZoomFactor"|↧1×1.11111111) °"M"                       # double Zoom Movement speed adjustment factor
  | ⍜(get"ZoomFactor"|↥1e¯5×0.9) °"N"                           # double Zoom Movement speed adjustment factor
  | ⍜(get"Resolution"|↧2048×2) °"q"                             # double output resolution
  | ⍜(get"Resolution"|↥8×0.5) °"e"                              # halve output resolution
  | InitStateMap ◌ °"Z"                                         # Reset state with new random complex value
  | (
      ∘°"h"
      &p "Rob's Julia set viewer"
      &p "keybinds:"
      &p "wasd: pan camera  WASD: move around complex plane"
      &p "qe: Resolution Up/Down QE: Complex plane speed Up/Down"
      &p "rf: Zoom In/Out RF: Less/More Iterations"
      &p "MN: Movement speed Up/Down"
    )
  | ∘◌ # Ignore other keys
  )
  RandomColors Image. &s.
  # &ims
  &fwa "out.jpg" &ime "jpg"
)

# Shift X
Continue ← ¬≍"X"
Main ← (
  &raw 1
  ⍢(&rs 1 0 ReadInput)(Continue) " " InitStateMap
  &raw 0
  ◌◌
  &p"Goodbye!"
)

⍣(Main|&raw0)
