Multiline ← "(?m)"
Operators ← "\\+\\*\\/\\-\\^\\&\\!"

Id ← "\\w+"
Digit ← "-?\\d+"
EOL ← "(?:\n)"

Fn ← $"(?:_|[_])" Id Operators
Arg ← $"(?:_|_)" Fn Digit
Expression ← $"(?: ?_)+_" Arg EOL
Arguments ← $"(?: _)*" Id
Signature ← $"(_)(_):_" Id Arguments EOL

Var ← $" {2,}_:" Id
Assignment ← $"__" Var Expression
Declare ← $"(?:_)+" Assignment
Return ← $"\s{2,}_" Expression
Body ← $"(_)?(_)" Declare Return

Function ← $"(_)(_)" Signature Body

ParseTag ← ⬚(□"")regex

Remove ← ⊂:↘⊃(⧻|⊃↘↙⊢⊚⌕⊙.):
Comment ← " *#.*"
RemoveAllComments ← ⊙;⍢(Remove ⊙⊃(°□⊢⊢|↘1)|>0⧻⋅∘):regex Comment.

&p.RemoveAllComments &p "Input File:" &fras "sample.rob"

ParseTag Function
Function
