Input ← ⊜□≠,@, ▽≠@\n. &fras
H ← ⊐∧(◿256×17+) :0 -@\0

Correct ← ≡⍜°□((∘|⊂:"=0"↘¯1)/↥=@-.)
r ← "([a-z]+)=?([\\d])"
Parse ← ⍜(°⊟⍉)⊓(∘|⋕)≡(↘1⊢regex r)
Hashmap ← [⍥(□↯0_2 0)256]
Replace ← ⍜▽;⊙:⊢⍉=,,¤
Zeros ← ▽≠0∵°□⊢⇌⍉.
Update ← ⍜°□(Zeros (⊂:¤|Replace)⊃(∊⊓⊢(⊢⍉))⊙∘⊢:)
Insert ← :⍜⊏Update⊙:H⊢⊢.⊙:⊃↙↘1
i ← +1⇡⧻
Lens ← □×i. ⊐(⊢⇌⍉)
Score ← /+⊐≡(/+×)≡Lens ∩▽⊙:.≡(±⧻).:i.

Silver ← /+≡H
Gold ← Score ;⍥Insert ⧻.:Hashmap Parse Correct

⊃(Gold|Silver) Input "input.txt"
