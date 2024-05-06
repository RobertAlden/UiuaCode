# Experimental!
# Mandlebrot

~ "../lib/Graphics.ua" ~ NormalRange
Nr ← NormalRange

Location ← 0 0
Resolution ← 3
Zoom ← 1
Iterations ← 20
Z ← ⊂+⊙,×.⊢.
Cf ← +×⊞ℂ.⊂¯⇌↘1.Nr⁅
Image ← /+>2⌵⊙◌⍥Z⊙([Cf])⊙⊙⊙∩ℂ°[⊙⊙⊙⊙⊙⊙∘]
Colors ← ⊏:⊂0_0_0∵⋅⚂_⚂_⚂⇡/↥♭.
InputMap ← ⟨
  ∘
| -×0.1×[0 0 0 1 0 0 0]⊏2.       # w
| +×0.1×[0 0 0 1 0 0 0]⊏2.       # s
| -×0.1×[0 0 0 0 1 0 0]⊏2.       # a
| +×0.1×[0 0 0 0 1 0 0]⊏2.       # d
| ×[1 1 1.1111111111111 1 1 1 1] # i
| ×[1 1 0.9 1 1 1 1]             # k
| ×[1 2 1 1 1 1 1]               # j
| ×[1 0.5 1 1 1 1 1]             # l
| +××0.01[0 0 0 0 0 0 1]⊏2.      # t
| -××0.01[0 0 0 0 0 0 1]⊏2.      # g
| +××0.01[0 0 0 0 0 1 0]⊏2.      # f
| -××0.01[0 0 0 0 0 1 0]⊏2.      # h
| +[1 0 0 0 0 0 0]               # z
| -[1 0 0 0 0 0 0]               # x 
| ∘
⟩
# Image
ReadInput ← (
  # [Iterations Resolution Zoom Y X W Z]
  InputMap ⊢⊗:" wsadikjltgfhzx"
  &p. &ims Colors Image.
)

Continue ← ¬≍"q"
Main ← (
  &raw 1
  ⍢(&rs 1 0 ReadInput)(Continue) " "
  &raw 0
)
[Iterations Resolution Zoom Location 0 0]

Main
