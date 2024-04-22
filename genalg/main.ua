# Experimental!

Size ← 256_256
Init ← ⌊÷2
World ← ↯:0
E ← +-:1⊃(∘|××2) 0.05
F ← ⟨0◌|×E⚂⊏⌊×⚂⧻.▽⊸>0♭⟩×⊃(>0/+/+|=0⊡1_1|∘)
Pad ← ⍥(⇌⍉≡(⊂0))4
UnPad ← ⊡+1⇡Size
Iter ← +≡≡F ◫3_3 Pad .
⍜now(&fwa "genalg/out.png" &ime "jpg" ⍉[⍥(⍥Iter ⌊÷2⊢Size ⍜⊡◌⊙⊙0.5 ⊃(Init|World) Size)3])
$"took _ seconds."
&p "done!"
