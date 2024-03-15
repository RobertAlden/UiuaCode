# Experimental!

W ← ⌊÷10 1080_1920
Ms ← 10_10
P ← 100
C ← 5
Colors ← ⊂0_0_0[⍥⚂_⚂_⚂] C
CMap ← ⊂0⌈×C[⍥⚂]P
R ← 256
A ← -1×2↯:[⍥⚂]/×. ⊂.C
Points ← ↙P ◴⌊×¤W [⍥⚂_⚂] ×2 P
Vs ← -¤÷2Ms×¤Ms[⍥⚂_⚂] P
Dist ← ⁅√/+×.-
RCalc ← ÷R×<R.⊞Dist.
Render ← &fwa "out.png" &ime "jpg" ⊏:Colors ⊏:CMap /↥≡⍜⊡◌ ⊙¤⊙::⇡⊸⧻⟜(°⊚)⌊ ◿¤W
Simulate ← +Vs
FrameRate ← 0.25
Run ← ⍢(Render. Simulate &sl FrameRate)1
# Run Points
# CMap Points
B ← 0.3
⟨÷B|÷⟜-0.35⟩⊸(>⌵)⟜-B÷R 93 0.65
