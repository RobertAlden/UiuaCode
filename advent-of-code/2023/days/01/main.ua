⊜□≠@\n. &fras "input.txt"

Silver ← (/+≡(parse⊂:∩⊢⇌.▽<0-@a.⊔))

D ← {"one" "two" "three" "four" "five" "six" "seven" "eight" "nine"}
Normalize ← ⊐/⊂⊐∵(⍣(⊏:D-1parse|;:))
TextToDigits ← (+1⊏⍏:⍘⊟⍉⊚⬚0⊐≡(⬚@ ⌕) D ¤)
FormatToNumber ← (parse⊂∩(⍘parse⊢):⇌.)
Gold ← (/+≡(FormatToNumber TextToDigits ⊔)⊐≡(Normalize))

⊃(Gold|Silver)
