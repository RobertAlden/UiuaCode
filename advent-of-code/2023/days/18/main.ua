r ← "(\\w) (\\d+) \\((#\\w{6})\\)"
C ← ≡⍥(×i):1⊗:"RDLU"°□
Input ← :♭⊜(⊓(C|⋕|°□)°[⊙⊙∘]↘1⊢regex r)≠@\n.&fras

Area ← /+×⊓+-∩(↻1.)
Silver ← +1÷2+⊃(Area °ℂ\+×|/+)

HexMap ← ⊂+@0⇡10 +@a⇡6
HexToInst ← ⊓(/+×ⁿ:16⇌⇡⧻.|≡⍥(×i):1) ⊃↘↙¯1∵(⊗:HexMap) ↘1

Gold ← Silver ⊙(⊢⍉)≡HexToInst⋅⋅∘

⊃(Gold|Silver)Input "input.txt"
