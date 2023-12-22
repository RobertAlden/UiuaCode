# Uiua Record Library

New ← ♭⍉⊟
Keys ← ▽¬◿2⇡⧻.
Values ← ▽◿2⇡⧻.
IsKey ← ∊⊓□Keys
Update ← ⍜⊏;+1⊃(⊗□)⋅∘⊙:
Set ← (⊂:{⊙∘}|Update)⊃(IsKey⊙⋅∘)⊙⊙∘
Get ← °□⊏+1×2⊗:Keys,□
Peek ← ⊃(Get)⋅∘

# FieldNames(box array) Regex(string) -> Record
ParseToRec ← New ⊙(↘1⊢regex)

Apply! ← (Set ⊃∘(^1 Peek))

New {"this" "that" "the other"} {123 456 789}

Apply!(+1) "this"
