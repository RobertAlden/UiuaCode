# SCR
InitScreen ← (↯⊂.⊢:0)
# [X Y V] SCR => SCR
Plot ← (⍜⊡;⊙:⊃↙(⊢↘)2)
# XYVmat SCR => SCR
PlotM ← (/↥≡Plot ⊙¤)
# [XY0 XY1] => Slope
Slope ← (/÷/-)
# [XY0 XY1] => [X0..X1]
Span ← (⇡+1/↥⌵/-)
# XYMat => bool XYmat
Offset ← (⊏/<≡(⁅√/+×.).)
# XYMat => bool XYmat
XyOrYx ← ((0|1)⊃(≥1⌵Slope)∘)
# Slope Xarr => Yarr Xarr
XsToYs ← (⊟⁅×,⊃(Slope|Span))
Correct ← (∘|∘|∘)
# [XY0 XY1] => XYmat
Line ← (⍉+Correct ⸮ ⊙Offset ⊙⊃∘(XsToYs) XyOrYx)
Lines ← (⊐(/⊂≡Line))
Draw ← (PlotM ≡⊂)
# XYList => XY0_XY1mat
Strides ← (◫2⊂⊃∘⊢)
Polygon ← (Lines Strides)

Main ← (
  1 InitScreen 20_1

  # Line [5_1 5_16]
  # Line [16_5 3_5]
  # Line [5_5 9_9]
  # Slope [5_16 16_5]
  Line [2_3 5_10]
  # Lines Strides [2_3 5_10 4_8]
  &ims Draw
)
Main
