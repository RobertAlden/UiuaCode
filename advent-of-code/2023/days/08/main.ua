Input ← (
  ⊜□¬⌕"\n\n".&fras
  ⊃(°□⊢↘¯1↘1|°□⊢)
  ⊜(regex "[0-9A-Z]{3}")≠@\n.
  ≡⊃(⊢|↘1)≡♭
  ⊃(≡°□⋅∘)⊗:
  ⊃(⋅⋅∘|⊙∘)
  ⊗:"LR"
  0
)
Next ← ⊃(⊏:⊙(⊡⊂)⊃(:⊗⊙.⊙⋅⋅∘|⋅⊏)⊢)∘
Step ← ⊙(;;)⋅(◿:⊓(+1|⧻))
IterI ← ⊂⊃(Next|Step|⋅⋅⊙⊙∘)
StopI ← ¬≍"ZZZ"⊢
FindLength ← -1⊃⧻(;;;;;)⍢(IterI|StopI)
Silver ← FindLength ["AAA"]

StartingKeys ← ▽♭≡(="A"⊢⇌).⋅⋅∘
Fix ← ⊓(≡(□¤)|∩¤⊙∘|∩¤)
IterII ← □⊂⊙°□⊃(Next|Step|⋅⋅⊙⊙∘)
StopII ← ≠@Z⊢⇌⊢

GCD ← ;⍢(-,(:|⊙∘)<,,|≠)
LCM ← ÷⊃GCD×

Gold ← (
  /LCM ≡(-1⊃⧻(;;;;;)⍢(IterII|StopII)) Fix ⊃(StartingKeys|⊙⊙∘)
)

⍜now(⊃(Gold|Silver) Input "input.txt")
