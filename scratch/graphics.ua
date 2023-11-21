# SCR
InitScreen ← (↯⊂.⊢:0)
# [X Y V] SCR => SCR
Plot ← (⍜⊡;⊙:⊃↙(⊢↘)2)
# XYVmat SCR => SCR
PlotM ← (/↥≡Plot ⊙¤)
# [XY0 XY1] => Slope
Slope ← (/÷≡/-⍉)
# [XY0 XY1] => [X0..X1]
Span ← (⇡+1/↥⌵/-)
# XYMat => bool XYmat
OrderXYs ← ((0⇌|1)/>≡(⁅√/+×.).)
# XYMat => bool XYmat
XyOrYx ← ((0≡⇌|1)⊃(<1⌵Slope)∘)
# Slope Xarr => Yarr Xarr
XsToYs ← (⊟⁅×,⊃(Slope|Span))
# [XY0 XY1] V SCR => SCR
DrawLine ← (PlotM⍉⊂(∘|⇌)⊙+(∘|⊙⇌)⊙⊙(⊢⊃∘XsToYs) ⊙XyOrYx OrderXYs)
# XYList => XY0_XY1mat
Strides ← (◫2⊂⊃∘⊢)
# XYList V SCR => SCR

Main ← (
  InitScreen 20_1
  DrawLine [1_1 12_1] 1
  DrawLine [1_1 1_12] 1
  DrawLine [12_1 1_12] 1
  DrawLine [3_3 9_9] 1
  &ims
  # DrawLine [3_6 10_15] 1
)
Main
