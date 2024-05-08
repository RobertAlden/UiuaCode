# Julia/Mandlebrot set viewer

Nr ← (⊂0÷⟜⍜¯⇡⌊-1)    # (N)ormal (r)ange
Ncf ← ⊞ℂ⇌.⊂¯⇌⟜(↘1)Nr # (N)ormal (c)omplex (f)ield

# Unpacks state values from map and creates the julia/mandlebrot set iteration values.

# Interpolates between two colors
ColorArgs ← °{⊙∘}≡get{"Color1" "Color2"}¤
ColorLerp ← (≡⍜-×¤⊙¤ ⊙⊙(Nr))

StateKeys ← {"Resolution" "Zoom" "Position" "Complex" "Iterations" "ZoomFactor" "ComplexFactor" "Color1" "Color2" "Mode"}
StateValues ← {16 1 (ℂ0 0) (/ℂ-0.5⚂_⚂) 15 0.2 0.032 ⚂_⚂_⚂ ⚂_⚂_⚂ 0}
InitStateMap ← (map StateKeys StateValues)

Z ← memo(⊂+×.⊢⊙,.)
# Interprets the StateMap to produce either a julia set or a mandlebrot set
JuliaArgs ← °{⊙⊙⊙⊙∘}≡get{"Resolution" "Zoom" "Position" "Complex" "Iterations"}¤
Julia ← (/+>2⌵⊙◌⍥(Z)⊃⋅⋅∘⊙∘[∘]+×Ncf)
MandleArgs ← °{⊙⊙⊙∘}≡get{"Resolution" "Zoom" "Position" "Iterations"}¤
Mandlebrot ← (/+>2⌵⊙◌⍥(Z)⊃⋅⋅∘⊙∘[∘].+×Ncf)
RenderState ← memo(
  ⊃(ColorArgs|↧100/↥♭. ⟨Julia JuliaArgs|Mandlebrot MandleArgs⟩ °□get"Mode".)
  ⊏◿⧻⟜:⊂↯:0⊢⇌△. ⊂ ⇌. ColorLerp
)

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
  | ⍜(get"Iterations"|↧1000+5) °"F"                             # Increase iteration depth
  | ⍜(get"Iterations"|↥5-5) °"R"                                # Decrese iteration depth
  | ⍜(get"ComplexFactor"|↧0.5×2) °"Q"                           # Double complex plane movement speed
  | ⍜(get"ComplexFactor"|↥1e¯5×0.5) °"E"                        # Halve complex plane movement speed
  | ⍜(get"Zoom"|↧2 ×1.11111111) °"r"                            # Zoom out
  | ⍜(get"Zoom"|↥1e¯5×0.9) °"f"                                 # Zoom in
  | ⍜(get"ZoomFactor"|↧1×1.11111111) °"M"                       # double Zoom Movement speed adjustment factor
  | ⍜(get"ZoomFactor"|↥1e¯5×0.9) °"N"                           # double Zoom Movement speed adjustment factor
  | ⍜(get"Resolution"|↧2048×2) °"q"                             # double output resolution
  | ⍜(get"Resolution"|↥8×0.5) °"e"                              # halve output resolution
  | ⍜(get"Color1"|⋅⚂_⚂_⚂) °"c"                                  # double output resolution
  | ⍜(get"Color2"|⋅⚂_⚂_⚂) °"C"                                  # halve output resolution
  |                                                             # switch between Julia/Mandlebrot set, while setting complex number to camera position or vice versa.
    (
      °□get"Mode".°"v"
      ⟨insert"Position" get"Complex".|insert"Complex" get"Position".⟩
      ⍜(get"Mode"|¬)
    )
  | InitStateMap ◌ °"Z" # Reset state with new random complex value
  | (
      ∘°"h"
      &p "Rob's Julia set viewer"
      &p "keybinds:"
      &p "wasd: pan camera    WASD: move around complex plane"
      &p "qe: Resolution Up/Down    QE: Complex plane speed Up/Down"
      &p "rf: Zoom In/Out    RF: Less/More Iterations"
      &p "MN: Movement speed Up/Down    Z: Reset  X: Exit"
      &p "c: Change inner color    C: Change outer color"
      &p "v: Switch between Julia set and Mandlebrot set"
    )
  | ∘◌ # Ignore other keys
  )
  :$"Took _ seconds to render."⍜nowRenderState. &s.
  ⊃(&ims|&fwa "out.jpg" &ime "jpg")
  &p
)
Continue ← ¬≍"X"
Main ← (
  &p "press h for help!"
  &raw 1
  ⍢(&rs 1 0 ReadInput)(Continue) " " InitStateMap
  &raw 0
  ◌◌
  &p"Goodbye!"
)
# ¯0.7732207332854895+0.28475890727827047i
Main
