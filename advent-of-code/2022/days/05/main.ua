&fras "input.txt"
⊐⊜(⊜□≠@\n.)≃¬⌕"\n\n".
/⊔.
⊐≡⊜□≠@ .
⍜⍉(⊏[1 3 5])
⊃↙↘¯1∶⊐∵parse
↘¯1\+≃[⍥4] /↥⊜parse≠@ .⊢
⊏∶⍉∶
≡(⊜□≠@ .)
⊂□[]↯¯1
Withdraw ← (|2.2 ⊔⊢⊐⍜↻(⊃↙↘1))
Insert ← (↻¯⊙(⊂□))
Slice ← (|2.2 ⊃↙↘)
Extract ← (⊙Insert∶⊙Slice ∶⊙⊙Withdraw ⊙.)
Graft ← (Insert ⊙(⊂⊙Withdraw∶).)
GraftRev ← (Insert ⊙(⊂⇌⊙Withdraw∶).)
MoveBoxesOneAtATime ← (GraftRev∶⊙∶Extract ⍘⊟⊙∶⊃↙(⊢↘)2)
MoveBoxesAllTogether ← (Graft∶⊙∶Extract ⍘⊟⊙∶⊃↙(⊢↘)2)
Answer ← (≡⊢↘1)

Silver ← (Answer ∧~⋄MoveBoxesOneAtATime∶)
Gold ← (Answer ∧~⋄MoveBoxesAllTogether∶)

⊃(Silver)(Gold)
