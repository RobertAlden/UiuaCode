Input ← ⊜∘≠,@\n&fras

# Magic Numbers!
Mns ← [0 56 26 50 152 176 146 186 255]
Pieces ← ".-JL7F|S"
Tiles ← ≡(↯3_3)⋯Mns

Join ← /⊂≡(⍉/⊂≡(⍉))
Map ← Join ⊏:Tiles⊗:Pieces
Start ← +1×3⊚=@S
Adj ← ⊝⊂/⊂⊠+[0_1 1_0 ¯1_0 0_¯1].
Iter ← ⊚×⊃(⊙⋅∘|⋅⊙∘)⊃⍜¬↥∘⍜⊡(+1)⊓(Adj|×0.)
Image ← ⊃⊙⊙⊙∘(⊂□⋅⊙⋅⋅∘)

Silver ← (
  ⊃(Start|×0.Map) ⊙[]
  []⊃∘(⍜⊡(+1))
  ÷6-2⧻⊙(;;;)⍢(Image ⊃⊂(⋅Iter)|≠0⧻,)
)
Silver Input "test.txt"
⬚0≡(°⊚°□) ⇌:
# &fwa "out.gif" &gife 50
