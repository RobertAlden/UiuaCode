r ← "Valve (\\w{2}) .*? rate=(\\d+); tunnels? leads? to valves?(.*)"
Hash ← /+×100_1-@A
Read ← ♭[⊂⊂⊙⊙∘]⊃(Hash ⊔⊏0|parse ⊏1|⊜(Hash↘1)≠@,.⊏2)↘1regex r
Interpret ← ⊐⬚¯1⊜Read≠@\n. &fras

Interpret "test.txt"
c ← ⊡⊙⍉ # (c)olumn
⊃(⊏⍏.c 0|≡↘2)

IsUni ← =∩⧻⊝.

Spread ← ⊙▽:/×⊠≠,,⊃(∘|▽⊙.:⋅⊙∘)⊃(⊂⊙⊙∘|≡/↥/↥⊠=⊙.⋅⊙⋅∘)

Path ← ⊙(;;)⍢(+⊙(:⊙(+1IsUni.) Spread))(⋅⋅IsUni) 0 []
0 [] ≡Hash"AA"_"GG"
+⊙(:⊙(⊝..) Spread)
