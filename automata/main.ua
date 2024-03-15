# Experimental!

States ← 18
Colors ← [⍥⚂_⚂_⚂] States
Size ← ⌊×4 32_32

World ← ⌊×States↯⊙[⍥⚂] ⟜/×Size

Ns ← ◫3_3⍥(⍉⇌≡(⊂¯1))4
Next ← ≠⊙⧻⊸⊗◿States+1⊏4.♭

Iter ← ◿States+≡≡Next Ns.
&fwa "automata/cyclic.gif" &gife 50 ⊏:Colors ⊂⇌.[⍥(⍥(Iter)5.)] 25 World
