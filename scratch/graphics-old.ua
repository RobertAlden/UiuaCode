# SCR
InitScreen ← (↯⊂.⊢&ts 0)
# X Y V SCR => SCR
Plot ← (⍜⊡;⊙∶⊂)
# Xarr Yarr V SCR => SCR
PlotM ← (/↥≑~~∸⋄Plot)
# X0 Y0 X1 Y1 => Slope
Slope ← (÷∩-⊙∶)
# If xy ordering would result in a bad slope, reorders xys
# such that x0y0x1y1=>y0x0y1x1 and returns a bool
# indicating if this occured
OrderXYs ← (0|1⊃(∶⊙∘)(∶⋅⋅⊙∘))⊃(>∩-⊙∶)(⊙⊙⊙∘)
# X0 Y0 X1 Y1 => [X0..X1]
Span ← (⊙(;;)⇡+1-⊙∶)
# X0 Y0 X1 Y1 => Xarr Yarr
Line ← (∩⌊(∘|∶)⊙(∩+⊙∶⊙×.⊃⊃(Span)(Slope)(⊙∘)) OrderXYs)
# X0 Y0 X1 Y1 V SCR => SCR
DrawLine ← (PlotM Line)
Main ← (
  InitScreen
  DrawLine 2 20 20 20 1
  DrawLine 7 15 7 25 1
  &ims
)
Main
