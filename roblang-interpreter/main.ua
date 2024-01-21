Symbols ← "\\[\\+\\*\\]"
Fun ← "(?m)\\w+[\\w ]+:$"
Var ← "\\w+[\\w ]+:"
Comment ← "#.*"
Digit ← "(?m)\\d+"
Id ← "(?m)\\w+"
Remove ← ⊂:↘⊃(⧻|⊃↘↙⊢⊚⌕⊙.):
RemoveComments ← ⊙;⍢(Remove ⊙⊃(°□⊢⊢|↘1)|>0⧻⋅∘):regex Comment.

RemoveComments &fras "sample.rob"
⊠(□regex°□) {Symbols Id Digit Fun Var} ¤
