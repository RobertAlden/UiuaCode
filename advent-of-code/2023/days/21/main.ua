Input ← ↯:0△./↥⊠="S." ⊜∘≠@\n.&fras

Pad ← ⍥(⇌⍉≡⊂0)4
Adj ← /↥⬚0≡↻⍉[°ℂ][⍥(×i.)3 ℂ 0 1] ¤

Silver ← ⍥(×,Adj) ⊙(⬚0↥°⊚¤ ×⊙(-1△.))
Visual ← ⊙(;;)⍥⊃(⊂⊙¤|×,Adj;) :[]

Goal ← 26501365
# Goal ← 500
Corners ← [0_0 1_0 0_1 1_1]
Edges ← [0.5_0 0_0.5 1_0.5 0.5_1]
W ← 131
CSN ← +1×2×+1.
FullTiles ← CSN ⌊÷W Goal
EdgeCount ← -1⌊÷W Goal

# +1↯:⇡/×.9_9
Split ← [⊃↙↘:⊙:⊃↙↘]⊙:+..÷3
Fragment ← ≡(≡⍉Split)⊙(≡⍉Split)°⊟△.
Matrix ← [⊙⊙∘],⊃([⊙⊙∘],:⊙(+4+⊃(×4|CSN)-1) 1|↯3 1)

Input "input.txt"
⊙;Silver+⊃(×1|⌊÷2)W 0.5_0.5↯:0△.⍉/⊂≡(⍉/⊂↯3)↯3;
≡≡(/+/+&ims.)Fragment&ims.

# ≡⊡[2_0 0_1 2_2]¤.

F ← +4+⊃(×4|CSN)-1
×F ÷W-65Goal⊡1_1
