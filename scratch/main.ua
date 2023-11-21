ImgSize ← 32_32
Noise ← (↯⊃∘([⍥⚂]/×))
r ← (⌊×⚂) # Random [0,n)
RandomColors ← (↯⍜⇌⊂¯1⊃∘([⍥(↻r⊃⧻∘ 1_0_0)]/×))

Lerp ← (⍜(×100)⌈+⊃∘(×-))
LerpIter ← (⊃(Lerp)⋅⊙∘)
GenLerpRange ← (⇌;;;⍢(⊃(⊙⊙∘)(⟜⟜⊂)LerpIter)(≠)⊙⊙⊙[])

RangeLerp ← (⊏⍏.⊝⊂⊃∘(≡(Lerp⊙⊙0.5⍘⊟)◫2))
PadZeros ← (↻⊙(⬚0+↯:0)⊃(¯⊟.)(++.)⊙⊃△∘)
#
# 0 1 0.23
# GenLerpRange
# RangeLerp
# ;
# RandomColors ImgSize
# &ims
# &fwa "./out.jpg" &ime "jpg"

↯⊃∘(⁅[⍥⚂]/×)5_5
PadZeros 3
