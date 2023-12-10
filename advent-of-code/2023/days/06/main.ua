InputI ← ⍘⊟ ↯2_4 ⊐∵parse regex "\\d+" &fras
InputII ← ⊃↙↘1⊐≡(parse ⊔⍥/⊂2)⊜(regex "\\d+")≠@\n.&fras

Silver ← /×≡(/+<×⊃(∘|-)⊃(⇡|∘)) InputI
Gold ← /×≡(/+<×⊃(∘|-)⊃(⇡|∘)) InputII
⊃(Gold|Silver) "input.txt"
