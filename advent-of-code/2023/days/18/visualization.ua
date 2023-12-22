r ← "(\\w) (\\d+) \\((#\\w{6})\\)"
C ← ≡⍥(×i):1⊗:"RDLU"°□
Input ← :♭⊜(⊓(C|⋕|°□)°[⊙⊙∘]↘1⊢regex r)≠@\n.&fras

Area ← /+×⊓+-∩(↻1.)

HexMap ← ⊂+@0⇡10 +@a⇡6
HexToRgb ← ⍜(×1e2)⌊÷255≡(≡/+×≡(ⁿ:16⇌⇡⧻.)↯3_2)∵(⊗:HexMap) ≡↘1
Flood ← ≡≡((⊡1_1|/↥/↥)=0⊡1_1.) ◫3_3 ⍥(⇌⍉≡⊂0)4

Visualize ← (
  ⊙⊙HexToRgb
  ,⇡⧻.
  :∩(⊐/⊂≡(□↯))
  °⊚⌵▽:⍉[°ℂ]\+
  ⍢(Flood|/↥/↥=0)
  # &fwa "out.png" &ime "png" ±⊙;
)
Visualize Input "input.txt"
